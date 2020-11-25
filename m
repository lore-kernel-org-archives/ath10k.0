Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki2b9-0001ir-1T
 for ath10k@lists.infradead.org; Wed, 25 Nov 2020 21:45:12 +0000
Received: by mail-il1-x141.google.com with SMTP id f5so3472619ilj.9
 for <ath10k@lists.infradead.org>; Wed, 25 Nov 2020 13:45:08 -0800 (PST)
Subject: Re: [PATCH net-next 1/2] soc: qcom: ipa: Constify static qmi structs
References: <20201122234031.33432-1-rikard.falkeborn@gmail.com>
 <20201122234031.33432-2-rikard.falkeborn@gmail.com>
From: Alex Elder <elder@ieee.org>
Message-ID: <ee9dfc18-092e-6a5c-d310-d4ce52db6042@ieee.org>
Date: Wed, 25 Nov 2020 15:45:05 -0600
MIME-Version: 1.0
In-Reply-To: <20201122234031.33432-2-rikard.falkeborn@gmail.com>
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Alex Elder <elder@kernel.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 11/22/20 5:40 PM, Rikard Falkeborn wrote:
> These are only used as input arguments to qmi_handle_init() which
> accepts const pointers to both qmi_ops and qmi_msg_handler. Make them
> const to allow the compiler to put them in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Good idea.  Thanks a lot.

Acked-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/net/ipa/ipa_qmi.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
> index 5090f0f923ad..d2c3f273c233 100644
> --- a/drivers/net/ipa/ipa_qmi.c
> +++ b/drivers/net/ipa/ipa_qmi.c
> @@ -168,7 +168,7 @@ static void ipa_server_bye(struct qmi_handle *qmi, unsigned int node)
>   	ipa_qmi->indication_sent = false;
>   }
>   
> -static struct qmi_ops ipa_server_ops = {
> +static const struct qmi_ops ipa_server_ops = {
>   	.bye		= ipa_server_bye,
>   };
>   
> @@ -234,7 +234,7 @@ static void ipa_server_driver_init_complete(struct qmi_handle *qmi,
>   }
>   
>   /* The server handles two request message types sent by the modem. */
> -static struct qmi_msg_handler ipa_server_msg_handlers[] = {
> +static const struct qmi_msg_handler ipa_server_msg_handlers[] = {
>   	{
>   		.type		= QMI_REQUEST,
>   		.msg_id		= IPA_QMI_INDICATION_REGISTER,
> @@ -261,7 +261,7 @@ static void ipa_client_init_driver(struct qmi_handle *qmi,
>   }
>   
>   /* The client handles one response message type sent by the modem. */
> -static struct qmi_msg_handler ipa_client_msg_handlers[] = {
> +static const struct qmi_msg_handler ipa_client_msg_handlers[] = {
>   	{
>   		.type		= QMI_RESPONSE,
>   		.msg_id		= IPA_QMI_INIT_DRIVER,
> @@ -463,7 +463,7 @@ ipa_client_new_server(struct qmi_handle *qmi, struct qmi_service *svc)
>   	return 0;
>   }
>   
> -static struct qmi_ops ipa_client_ops = {
> +static const struct qmi_ops ipa_client_ops = {
>   	.new_server	= ipa_client_new_server,
>   };
>   
> 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
