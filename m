Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHDBR-0005yx-Vi
 for ath10k@lists.infradead.org; Fri, 11 May 2018 18:54:27 +0000
Received: by mail-pf0-x241.google.com with SMTP id c10-v6so3120272pfi.12
 for <ath10k@lists.infradead.org>; Fri, 11 May 2018 11:54:15 -0700 (PDT)
Date: Fri, 11 May 2018 11:55:36 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 09/12] ath10k: Add QMI HOST CAP request support
Message-ID: <20180511185536.GT2259@tuxbook-pro>
References: <1522042866-26304-1-git-send-email-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1522042866-26304-1-git-send-email-govinds@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Sun 25 Mar 22:41 PDT 2018, Govind Singh wrote:

> Add support for host capablity request
> qmi message for wcn3990 target.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/qmi.c | 65 +++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index 65a43af..a33681d 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -357,6 +357,67 @@ static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
>  	return ret;
>  }
>  
> +static int ath10k_qmi_host_cap_send_sync(struct ath10k_qmi *qmi)
> +{
> +	struct wlfw_host_cap_resp_msg_v01 *resp;

This is 4 bytes,

> +	struct wlfw_host_cap_req_msg_v01 *req;

and this is 2 bytes, use the stack.

> +	struct qmi_txn txn;
> +	int ret;
> +
> +	req = kzalloc(sizeof(*req), GFP_KERNEL);
> +	if (!req)
> +		return -ENOMEM;
> +
> +	resp = kzalloc(sizeof(*resp), GFP_KERNEL);
> +	if (!resp) {
> +		kfree(req);
> +		return -ENOMEM;
> +	}
> +
> +	req->daemon_support_valid = 1;
> +	req->daemon_support = 0;
> +
> +	pr_debug("daemon_support is %d\n", req->daemon_support);

This print seems unnecessary.

> +
> +	ret = qmi_txn_init(&qmi->qmi_hdl, &txn,
> +			   wlfw_host_cap_resp_msg_v01_ei, resp);
> +	if (ret < 0) {
> +		pr_err("Fail to init txn for Capability resp %d\n", ret);

Same comments the rest of the function as given on previous patches.

> +		goto out;
> +	}

Regards,
Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
