// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 HomeDataStatus get globalDataStatus; HomeDataStatus get trendingDataStatus; HomeDataStatus get marketDataStatus; GlobalDataModel? get globalData; TrendingData? get trendingData; List<MarketCoinModel> get marketData; String? get errorMessage; bool get hasMoreMarkets; int get marketPage;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.globalDataStatus, globalDataStatus) || other.globalDataStatus == globalDataStatus)&&(identical(other.trendingDataStatus, trendingDataStatus) || other.trendingDataStatus == trendingDataStatus)&&(identical(other.marketDataStatus, marketDataStatus) || other.marketDataStatus == marketDataStatus)&&(identical(other.globalData, globalData) || other.globalData == globalData)&&(identical(other.trendingData, trendingData) || other.trendingData == trendingData)&&const DeepCollectionEquality().equals(other.marketData, marketData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.hasMoreMarkets, hasMoreMarkets) || other.hasMoreMarkets == hasMoreMarkets)&&(identical(other.marketPage, marketPage) || other.marketPage == marketPage));
}


@override
int get hashCode => Object.hash(runtimeType,globalDataStatus,trendingDataStatus,marketDataStatus,globalData,trendingData,const DeepCollectionEquality().hash(marketData),errorMessage,hasMoreMarkets,marketPage);

@override
String toString() {
  return 'HomeState(globalDataStatus: $globalDataStatus, trendingDataStatus: $trendingDataStatus, marketDataStatus: $marketDataStatus, globalData: $globalData, trendingData: $trendingData, marketData: $marketData, errorMessage: $errorMessage, hasMoreMarkets: $hasMoreMarkets, marketPage: $marketPage)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 HomeDataStatus globalDataStatus, HomeDataStatus trendingDataStatus, HomeDataStatus marketDataStatus, GlobalDataModel? globalData, TrendingData? trendingData, List<MarketCoinModel> marketData, String? errorMessage, bool hasMoreMarkets, int marketPage
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? globalDataStatus = null,Object? trendingDataStatus = null,Object? marketDataStatus = null,Object? globalData = freezed,Object? trendingData = freezed,Object? marketData = null,Object? errorMessage = freezed,Object? hasMoreMarkets = null,Object? marketPage = null,}) {
  return _then(_self.copyWith(
globalDataStatus: null == globalDataStatus ? _self.globalDataStatus : globalDataStatus // ignore: cast_nullable_to_non_nullable
as HomeDataStatus,trendingDataStatus: null == trendingDataStatus ? _self.trendingDataStatus : trendingDataStatus // ignore: cast_nullable_to_non_nullable
as HomeDataStatus,marketDataStatus: null == marketDataStatus ? _self.marketDataStatus : marketDataStatus // ignore: cast_nullable_to_non_nullable
as HomeDataStatus,globalData: freezed == globalData ? _self.globalData : globalData // ignore: cast_nullable_to_non_nullable
as GlobalDataModel?,trendingData: freezed == trendingData ? _self.trendingData : trendingData // ignore: cast_nullable_to_non_nullable
as TrendingData?,marketData: null == marketData ? _self.marketData : marketData // ignore: cast_nullable_to_non_nullable
as List<MarketCoinModel>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,hasMoreMarkets: null == hasMoreMarkets ? _self.hasMoreMarkets : hasMoreMarkets // ignore: cast_nullable_to_non_nullable
as bool,marketPage: null == marketPage ? _self.marketPage : marketPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeDataStatus globalDataStatus,  HomeDataStatus trendingDataStatus,  HomeDataStatus marketDataStatus,  GlobalDataModel? globalData,  TrendingData? trendingData,  List<MarketCoinModel> marketData,  String? errorMessage,  bool hasMoreMarkets,  int marketPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.globalDataStatus,_that.trendingDataStatus,_that.marketDataStatus,_that.globalData,_that.trendingData,_that.marketData,_that.errorMessage,_that.hasMoreMarkets,_that.marketPage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeDataStatus globalDataStatus,  HomeDataStatus trendingDataStatus,  HomeDataStatus marketDataStatus,  GlobalDataModel? globalData,  TrendingData? trendingData,  List<MarketCoinModel> marketData,  String? errorMessage,  bool hasMoreMarkets,  int marketPage)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.globalDataStatus,_that.trendingDataStatus,_that.marketDataStatus,_that.globalData,_that.trendingData,_that.marketData,_that.errorMessage,_that.hasMoreMarkets,_that.marketPage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeDataStatus globalDataStatus,  HomeDataStatus trendingDataStatus,  HomeDataStatus marketDataStatus,  GlobalDataModel? globalData,  TrendingData? trendingData,  List<MarketCoinModel> marketData,  String? errorMessage,  bool hasMoreMarkets,  int marketPage)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.globalDataStatus,_that.trendingDataStatus,_that.marketDataStatus,_that.globalData,_that.trendingData,_that.marketData,_that.errorMessage,_that.hasMoreMarkets,_that.marketPage);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.globalDataStatus = HomeDataStatus.initial, this.trendingDataStatus = HomeDataStatus.initial, this.marketDataStatus = HomeDataStatus.initial, this.globalData, this.trendingData, final  List<MarketCoinModel> marketData = const [], this.errorMessage, this.hasMoreMarkets = true, this.marketPage = 1}): _marketData = marketData;
  

@override@JsonKey() final  HomeDataStatus globalDataStatus;
@override@JsonKey() final  HomeDataStatus trendingDataStatus;
@override@JsonKey() final  HomeDataStatus marketDataStatus;
@override final  GlobalDataModel? globalData;
@override final  TrendingData? trendingData;
 final  List<MarketCoinModel> _marketData;
@override@JsonKey() List<MarketCoinModel> get marketData {
  if (_marketData is EqualUnmodifiableListView) return _marketData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_marketData);
}

@override final  String? errorMessage;
@override@JsonKey() final  bool hasMoreMarkets;
@override@JsonKey() final  int marketPage;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.globalDataStatus, globalDataStatus) || other.globalDataStatus == globalDataStatus)&&(identical(other.trendingDataStatus, trendingDataStatus) || other.trendingDataStatus == trendingDataStatus)&&(identical(other.marketDataStatus, marketDataStatus) || other.marketDataStatus == marketDataStatus)&&(identical(other.globalData, globalData) || other.globalData == globalData)&&(identical(other.trendingData, trendingData) || other.trendingData == trendingData)&&const DeepCollectionEquality().equals(other._marketData, _marketData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.hasMoreMarkets, hasMoreMarkets) || other.hasMoreMarkets == hasMoreMarkets)&&(identical(other.marketPage, marketPage) || other.marketPage == marketPage));
}


@override
int get hashCode => Object.hash(runtimeType,globalDataStatus,trendingDataStatus,marketDataStatus,globalData,trendingData,const DeepCollectionEquality().hash(_marketData),errorMessage,hasMoreMarkets,marketPage);

@override
String toString() {
  return 'HomeState(globalDataStatus: $globalDataStatus, trendingDataStatus: $trendingDataStatus, marketDataStatus: $marketDataStatus, globalData: $globalData, trendingData: $trendingData, marketData: $marketData, errorMessage: $errorMessage, hasMoreMarkets: $hasMoreMarkets, marketPage: $marketPage)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 HomeDataStatus globalDataStatus, HomeDataStatus trendingDataStatus, HomeDataStatus marketDataStatus, GlobalDataModel? globalData, TrendingData? trendingData, List<MarketCoinModel> marketData, String? errorMessage, bool hasMoreMarkets, int marketPage
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? globalDataStatus = null,Object? trendingDataStatus = null,Object? marketDataStatus = null,Object? globalData = freezed,Object? trendingData = freezed,Object? marketData = null,Object? errorMessage = freezed,Object? hasMoreMarkets = null,Object? marketPage = null,}) {
  return _then(_HomeState(
globalDataStatus: null == globalDataStatus ? _self.globalDataStatus : globalDataStatus // ignore: cast_nullable_to_non_nullable
as HomeDataStatus,trendingDataStatus: null == trendingDataStatus ? _self.trendingDataStatus : trendingDataStatus // ignore: cast_nullable_to_non_nullable
as HomeDataStatus,marketDataStatus: null == marketDataStatus ? _self.marketDataStatus : marketDataStatus // ignore: cast_nullable_to_non_nullable
as HomeDataStatus,globalData: freezed == globalData ? _self.globalData : globalData // ignore: cast_nullable_to_non_nullable
as GlobalDataModel?,trendingData: freezed == trendingData ? _self.trendingData : trendingData // ignore: cast_nullable_to_non_nullable
as TrendingData?,marketData: null == marketData ? _self._marketData : marketData // ignore: cast_nullable_to_non_nullable
as List<MarketCoinModel>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,hasMoreMarkets: null == hasMoreMarkets ? _self.hasMoreMarkets : hasMoreMarkets // ignore: cast_nullable_to_non_nullable
as bool,marketPage: null == marketPage ? _self.marketPage : marketPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
