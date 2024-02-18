import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
import 'package:alhamdulillah_courier_service_merchant/data/utils/base_url.dart';
import 'package:http/http.dart' as http;

class OrderHistoryApi extends GetConnect {
//Confirms Order By Id
  Future<dynamic> getConfirmOrders(
          {required String? fDate, required String? tDate, required status}) =>
      http
          .get(
            Uri.parse(
                '${BaseUrl.baseUrl}/confirm_orders?fromdate=$fDate&todate=$tDate&status=$status'),
            headers: <String, String>{
              'Accept': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjQ4ZjVhYWFjN2VkMzc1NGI3MmJjMTZjYTJmMmJlY2Q2NGQ1MzhkYThhNGZhYmE4YzMwOWFiNWY4MmUzMzEwNDBkNmQ1ZGNiOTlmODgzZTI1In0.eyJhdWQiOiIxMiIsImp0aSI6IjQ4ZjVhYWFjN2VkMzc1NGI3MmJjMTZjYTJmMmJlY2Q2NGQ1MzhkYThhNGZhYmE4YzMwOWFiNWY4MmUzMzEwNDBkNmQ1ZGNiOTlmODgzZTI1IiwiaWF0IjoxNzA0MzQ5NDk5LCJuYmYiOjE3MDQzNDk0OTksImV4cCI6MTczNTk3MTg5OSwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.HNTEVpYMooRjxIY10MIWCljG_JuhiLcGfhQghVPnfWdN6FqYOH7AIziqiewtEqg16ZQD4SQQZPXQ0A-4Cs5k6BKku2u1KQ0wL2IVq_k_gGCr2S7svx7iII--BGTw5fbxvLd3YB2-ochNqsb8uA2gd1Ocf6VhThtM8216j0Qa0kYx4ZGAvHsEYaia44gXd93H7mpyoptM7xdHOVXAiFm0kxjU0Hs-xchT0jULGtFFgTuwo2nharMPGO9KJ8plAvrQ8BHtmWVwn39nN6TEVg-fp6dmjDaJRaDyGowhjJUL6jhrfAiKUg4DnWZSCdVoIA0ksTb-t16TMqPo3YpHcOZ2CXfxBKtZvq4sbjcGmP_IwbBR0We-2xoXyVPU3vEjImiJls6cOMCnbKkVp2wcrhHNHMclWPX8cmIn0JlPkyYpKFcfkd_hBNt7rmVDBCZF1pCn8moP9u1Whor0VVyyRQzbTViPciFmjaqMVuPPQBe3uy19NI-lUKJJDqNm1YPe-lSBlrgOyP4OJ8FLR92AUSoAO3zwjfizujtIh42hcx8epvCcU3_D4J4NcunrNhYiV_V0UbuN73z4hDHeZhmWmXS3VyrA8lPj9EQWaQE7x8xLIqXAG9aIv50aeVsMTBID-akKC5IT8J3e-J1PNSgaVw92sLwhbWiB4WbfpqoaYGj8m0M'

              // 'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
            },
          )
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));
}
