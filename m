Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i59Zb-0006ad-P7
 for ath10k@lists.infradead.org; Tue, 03 Sep 2019 14:14:22 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] Fix a NULL-ptr-deref bug in
 ath10k_usb_alloc_urb_from_pipe
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190804003101.11541-1-benquike@gmail.com>
References: <20190804003101.11541-1-benquike@gmail.com>
Message-Id: <20190903141418.225AE60592@smtp.codeaurora.org>
Date: Tue,  3 Sep 2019 14:14:17 +0000 (UTC)
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
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, davem@davemloft.net

Hui Peng <benquike@gmail.com> wrote:

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
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

This causes a new warning, please build test your patches.

In file included from ./include/uapi/linux/posix_types.h:5,
                 from ./include/uapi/linux/types.h:14,
                 from ./include/linux/types.h:6,
                 from ./include/linux/list.h:5,
                 from ./include/linux/module.h:9,
                 from drivers/net/wireless/ath/ath10k/usb.c:8:
drivers/net/wireless/ath/ath10k/usb.c: In function 'ath10k_usb_free_urb_to_pipe':
./include/linux/stddef.h:8:14: warning: 'return' with a value, in function returning void
 #define NULL ((void *)0)
              ^
drivers/net/wireless/ath/ath10k/usb.c:64:10: note: in expansion of macro 'NULL'
   return NULL;
          ^~~~
drivers/net/wireless/ath/ath10k/usb.c:57:13: note: declared here
 static void ath10k_usb_free_urb_to_pipe(struct ath10k_usb_pipe *pipe,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11074657/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
