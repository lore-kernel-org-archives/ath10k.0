Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL3Y5-0006KC-3z
 for ath10k@lists.infradead.org; Mon, 29 Apr 2019 10:30:14 +0000
Received: by mail-qk1-x744.google.com with SMTP id w73so5540575qkb.13
 for <ath10k@lists.infradead.org>; Mon, 29 Apr 2019 03:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <1554260478-4161-1-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1554260478-4161-1-git-send-email-wgong@codeaurora.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 29 Apr 2019 18:30:00 +0800
Message-ID: <CANMq1KAU1B4Bweq3O6O8HOMwT7fHjj9tDyxqMsn_vn4gwxXL=Q@mail.gmail.com>
Subject: Re: [PATCH] ath10k: add peer id check in ath10k_peer_find_by_id
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
To: Wen Gong <wgong@codeaurora.org>
Cc: Claire Chang <tientzu@chromium.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Wed, Apr 3, 2019 at 3:01 AM Wen Gong <wgong@codeaurora.org> wrote:
>
> For some SDIO chip, the peer id is 65535 for MPDU with error status,
> then test_bit will trigger buffer overflow for peer's memory, if kasan
> enabled, it will report error.
>
> Add check for overflow the size of peer's peer_ids will avoid the buffer
> overflow access.
>
> Call trace of kasan:
> dump_backtrace+0x0/0x2ec
> show_stack+0x20/0x2c
> __dump_stack+0x20/0x28
> dump_stack+0xc8/0xec
> print_address_description+0x74/0x240
> kasan_report+0x250/0x26c
> __asan_report_load8_noabort+0x20/0x2c
> ath10k_peer_find_by_id+0x180/0x1e4 [ath10k_core]
> ath10k_htt_t2h_msg_handler+0x100c/0x2fd4 [ath10k_core]
> ath10k_htt_htc_t2h_msg_handler+0x20/0x34 [ath10k_core]
> ath10k_sdio_irq_handler+0xcc8/0x1678 [ath10k_sdio]
> process_sdio_pending_irqs+0xec/0x370
> sdio_run_irqs+0x68/0xe4
> sdio_irq_work+0x1c/0x28
> process_one_work+0x3d8/0x8b0
> worker_thread+0x508/0x7cc
> kthread+0x24c/0x264
> ret_from_fork+0x10/0x18
>
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00007-QCARMSWP-1.
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/txrx.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
> index 23606b6..33de9e1 100644
> --- a/drivers/net/wireless/ath/ath10k/txrx.c
> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
> @@ -157,6 +157,9 @@ struct ath10k_peer *ath10k_peer_find_by_id(struct ath10k *ar, int peer_id)
>  {
>         struct ath10k_peer *peer;
>
> +       if (peer_id >= sizeof(peer->peer_ids) * BITS_PER_BYTE)

I'd use >= BITS_PER_TYPE(peer->peer_ids).

> +               return NULL;
> +
>         lockdep_assert_held(&ar->data_lock);
>
>         list_for_each_entry(peer, &ar->peers, list)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
