import 'package:diska_app/features/home/data/models/offer_model.dart';
import 'package:diska_app/features/home/logic/cubits/offer_cubit/offer_cubit.dart';
import 'package:diska_app/features/home/logic/cubits/offer_cubit/offer_state.dart';
import 'package:diska_app/features/home/presentation/widgets/custom_indicator.dart';
import 'package:diska_app/features/home/presentation/widgets/offer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferSlider extends StatefulWidget {
  final List<OfferModel> offers;

  const OfferSlider({super.key, required this.offers});

  @override
  State<OfferSlider> createState() => _OfferSliderState();
}

class _OfferSliderState extends State<OfferSlider> {
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    context.read<OfferCubit>().startAutoSlide(widget.offers.length);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OfferCubit, OfferState>(
      listener: (context, state) {
        if (_controller.hasClients) {
          _controller.animateToPage(
            state.currentIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        }
        if (_controller.hasClients &&
            _controller.page?.round() != state.currentIndex) {}
      },
      child: BlocBuilder<OfferCubit, OfferState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 0.6.sh,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: widget.offers.length,
                  onPageChanged: (index) {
                    context.read<OfferCubit>().changeIndex(index);
                  },
                  itemBuilder: (_, index) {
                    return OfferCard(offer: widget.offers[index]);
                  },
                ),
              ),
              const SizedBox(height: 10),
              CustomIndicator(
                currentIndex: state.currentIndex,
                length: widget.offers.length,
              ),
            ],
          );
        },
      ),
    );
  }
}
