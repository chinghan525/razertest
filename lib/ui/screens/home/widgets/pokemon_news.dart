part of '../home.dart';

class _PokemonNews extends StatelessWidget {
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 28,
        right: 28,
        bottom: context.responsive(22),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Users',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        // _buildHeader(context),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 9,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return PokeNews(
              title: 'Pokémon Rumble Rush Arrives Soon',
              time: '15 May 2019',
              thumbnail: AppImages.thumbnail,
            );
          },
        ),
      ],
    );
  }
}
