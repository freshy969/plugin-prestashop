{*
* Team Paylike
*
*  @author    Team Paylike
*  @copyright Team Paylike
*  @license   MIT license: https://opensource.org/licenses/MIT
*}

<script>
var PAYLIKE_PUBLIC_KEY 	= "{$PAYLIKE_PUBLIC_KEY|escape:'htmlall':'UTF-8'}";
var paylike 			= Paylike(PAYLIKE_PUBLIC_KEY);
var id_cart 			= {$id_cart}; //html variable can not be escaped;
var customer_data 		= {$customer_data}; //html variable can not be escaped;
var other_data 			= {$other_data}; //html variable can not be escaped;
var paylikeproductsarray = {$paylikeproductsarray}; //html variable can not be escaped;
var shop_name 			= "{$shop_name|escape:'htmlall':'UTF-8'}";
var PS_SSL_ENABLED 		= "{$PS_SSL_ENABLED|escape:'htmlall':'UTF-8'}";
var host 				= "{$http_host|escape:'htmlall':'UTF-8'}";
var BASE_URI 			= "{$base_uri|escape:'htmlall':'UTF-8'}";
var iso_code 			= "{$iso_code|escape:'htmlall':'UTF-8'}";
var amount 				= "{$amount|escape:'htmlall':'UTF-8'}";
var description 		= "{$description|escape:'htmlall':'UTF-8'}";
var url_controller 		= "{$redirect_url|escape:'htmlall':'UTF-8'}";
var qry_str				= "{$qry_str}";

function pay()
{
	paylike.popup({
		title 			: shop_name,
		description 	: description,
		currency 		: iso_code,
		amount 			: amount,
		custom 			: {
			cartId		: id_cart,
			customer 	: customer_data,
			products 	: paylikeproductsarray,
			information : other_data
		},

	},
	function(err , r)
	{
		if (typeof r !== 'undefined')
		{
			var return_url = url_controller + qry_str + 'transactionid=' + r.transaction.id;
			if (err)
			{
				return console.warn(err);
			}
			location.href = htmlDecode(return_url);
		}
	});
}

function htmlDecode(url)
{
	return String(url).replace(/&amp;/g, '&');
}
</script>
<div class="row">
	<div class="col-xs-12">
		<p class="payment_module paylike" onclick="pay();">
			<span class="paylike_text">{l s='Pay with credit card' mod='paylike'}</span>
		</p>
	</div>
</div>
