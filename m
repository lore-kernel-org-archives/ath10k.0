Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fpJ74-0004aj-1M
 for ath10k@lists.infradead.org; Mon, 13 Aug 2018 20:06:51 +0000
Received: by mail-pg1-x543.google.com with SMTP id k3-v6so8017220pgq.5
 for <ath10k@lists.infradead.org>; Mon, 13 Aug 2018 13:06:39 -0700 (PDT)
Date: Mon, 13 Aug 2018 13:06:35 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v4 6/6] ath10k: Add QMI message handshake for wcn3990
 client
Message-ID: <20180813200633.GA38014@ban.mtv.corp.google.com>
References: <20180723123428.12993-1-govinds@codeaurora.org>
 <20180723123428.12993-7-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180723123428.12993-7-govinds@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, david.brown@linaro.org, niklas.cassel@linaro.org, andy.gross@linaro.org

Hi Govind,

On Mon, Jul 23, 2018 at 06:04:28PM +0530, Govind Singh wrote:
> Add WCN3990 QMI client handshakes for Q6 integrated WLAN connectivity
> subsystem. This layer is responsible for communicating qmi control
> messages to wifi fw QMI service using QMI messaging protocol.
> 
> Qualcomm MSM Interface(QMI) is a messaging format used to communicate
> between components running between remote processors with underlying
> transport layer based on integrated chipset(shared memory) or
> discrete chipset(PCI/USB/SDIO/UART).
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/Kconfig  |    1 +
>  drivers/net/wireless/ath/ath10k/Makefile |    4 +-
>  drivers/net/wireless/ath/ath10k/core.c   |    6 +-
>  drivers/net/wireless/ath/ath10k/core.h   |    2 +
>  drivers/net/wireless/ath/ath10k/qmi.c    | 1019 ++++++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/qmi.h    |  129 +++
>  drivers/net/wireless/ath/ath10k/snoc.c   |  262 +++++-
>  drivers/net/wireless/ath/ath10k/snoc.h   |    4 +
>  8 files changed, 1417 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath10k/qmi.c
>  create mode 100644 drivers/net/wireless/ath/ath10k/qmi.h
> 

> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> new file mode 100644
> index 000000000000..d91499a7354c
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -0,0 +1,1019 @@

...

> +int ath10k_qmi_deinit(struct ath10k *ar)
> +{
> +	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
> +	struct ath10k_qmi *qmi = ar_snoc->qmi;
> +
> +	cancel_work_sync(&qmi->event_work);
> +	destroy_workqueue(qmi->event_wq);

I believe this is incorrect ordering. You should not be destroying the
work queue that handles QMI event responses before you release the QMI
handle. As it stands, this means you segfault during 'rmmod'.

> +	qmi_handle_release(&qmi->qmi_hdl);

I think this should be:

	qmi_handle_release(&qmi->qmi_hdl);
	cancel_work_sync(&qmi->event_work);
	destroy_workqueue(qmi->event_wq);

> +	qmi = NULL;

This assignment is pointless, as 'qmi' is a local variable. Maybe you
meant to clear the struct member, as a precaution? So this would be:

	ar_snoc->qmi = NULL;

Brian

> +
> +	return 0;
> +} 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
