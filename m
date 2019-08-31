Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4AyH-00074w-4I
 for ath10k@lists.infradead.org; Sat, 31 Aug 2019 21:31:47 +0000
Received: by mail-pf1-x441.google.com with SMTP id w16so6716264pfn.7
 for <ath10k@lists.infradead.org>; Sat, 31 Aug 2019 14:31:42 -0700 (PDT)
Date: Sat, 31 Aug 2019 14:31:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] Fix a NULL-ptr-deref bug in
 ath10k_usb_alloc_urb_from_pipe
Message-ID: <20190831213139.GA32507@roeck-us.net>
References: <20190804003101.11541-1-benquike@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190804003101.11541-1-benquike@gmail.com>
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
To: Hui Peng <benquike@gmail.com>
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, davem@davemloft.net, kvalo@codeaurora.org

Hi,

On Sat, Aug 03, 2019 at 08:31:01PM -0400, Hui Peng wrote:
> The `ar_usb` field of `ath10k_usb_pipe_usb_pipe` objects
> are initialized to point to the containing `ath10k_usb` object
> according to endpoint descriptors read from the device side, as shown
> below in `ath10k_usb_setup_pipe_resources`:
> 
> for (i = 0; i < iface_desc->desc.bNumEndpoints; ++i) {
>         endpoint = &iface_desc->endpoint[i].desc;
> 
>         // get the address from endpoint descriptor
>         pipe_num = ath10k_usb_get_logical_pipe_num(ar_usb,
>                                                 endpoint->bEndpointAddress,
>                                                 &urbcount);
>         ......
>         // select the pipe object
>         pipe = &ar_usb->pipes[pipe_num];
> 
>         // initialize the ar_usb field
>         pipe->ar_usb = ar_usb;
> }
> 
> The driver assumes that the addresses reported in endpoint
> descriptors from device side  to be complete. If a device is
> malicious and does not report complete addresses, it may trigger
> NULL-ptr-deref `ath10k_usb_alloc_urb_from_pipe` and
> `ath10k_usb_free_urb_to_pipe`.
> 
> This patch fixes the bug by preventing potential NULL-ptr-deref.
> 
> Signed-off-by: Hui Peng <benquike@gmail.com>
> Reported-by: Hui Peng <benquike@gmail.com>
> Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>

This patch fixes CVE-2019-15099, which has CVSS scores of 7.5 (CVSS 3.0)
and 7.8 (CVSS 2.0). Yet, I don't find it in the upstream kernel or in Linux
next.

Is the patch going to be applied to the upstream kernel anytime soon ? If
not, is there reason to believe that its severity may not be as high as the
CVSS score indicates ?

Thanks,
Guenter

> ---
>  drivers/net/wireless/ath/ath10k/usb.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
> index e1420f67f776..14d86627b47f 100644
> --- a/drivers/net/wireless/ath/ath10k/usb.c
> +++ b/drivers/net/wireless/ath/ath10k/usb.c
> @@ -38,6 +38,10 @@ ath10k_usb_alloc_urb_from_pipe(struct ath10k_usb_pipe *pipe)
>  	struct ath10k_urb_context *urb_context = NULL;
>  	unsigned long flags;
>  
> +	/* bail if this pipe is not initialized */
> +	if (!pipe->ar_usb)
> +		return NULL;
> +
>  	spin_lock_irqsave(&pipe->ar_usb->cs_lock, flags);
>  	if (!list_empty(&pipe->urb_list_head)) {
>  		urb_context = list_first_entry(&pipe->urb_list_head,
> @@ -55,6 +59,10 @@ static void ath10k_usb_free_urb_to_pipe(struct ath10k_usb_pipe *pipe,
>  {
>  	unsigned long flags;
>  
> +	/* bail if this pipe is not initialized */
> +	if (!pipe->ar_usb)
> +		return NULL;
> +
>  	spin_lock_irqsave(&pipe->ar_usb->cs_lock, flags);
>  
>  	pipe->urb_cnt++;
> -- 
> 2.22.0
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
