Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bJs5s-0004u9-7r
 for ath10k@lists.infradead.org; Mon, 04 Jul 2016 00:50:36 +0000
Received: by mail-it0-x241.google.com with SMTP id h190so7440542ith.3
 for <ath10k@lists.infradead.org>; Sun, 03 Jul 2016 17:50:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1467356767-31646-1-git-send-email-c_traja@qti.qualcomm.com>
References: <1467356767-31646-1-git-send-email-c_traja@qti.qualcomm.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Mon, 4 Jul 2016 10:49:55 +1000
Message-ID: <CAGRGNgWd-5ef5bxOkthpfH1hjqO4HJuWuBA=jNRAr=geQDH1zA@mail.gmail.com>
Subject: Re: [PATCHv3 1/3] ath10k: move firmware_swap_code_seg_info to
 ath10k_fw_file
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
To: c_traja@qti.qualcomm.com
Cc: tamizhchelvam@codeaurora.org, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Hi Tamizh,

On Fri, Jul 1, 2016 at 5:06 PM,  <c_traja@qti.qualcomm.com> wrote:
> From: Tamizh chelvam <c_traja@qti.qualcomm.com>
>
> Preparation to make use of firmware_swap_code_seg_info for UTF binary.
>
> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c |    6 +++---
>  drivers/net/wireless/ath/ath10k/core.h |    6 ++----
>  drivers/net/wireless/ath/ath10k/swap.c |   26 ++++++++++++++------------
>  drivers/net/wireless/ath/ath10k/swap.h |   11 ++++++++---
>  4 files changed, 27 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> index 3da18c9..e69e7e7 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -654,6 +654,8 @@ struct ath10k_fw_file {
>
>         const void *codeswap_data;
>         size_t codeswap_len;
> +       /* FIXME: add a comment */
> +       struct ath10k_swap_code_seg_info *firmware_swap_code_seg_info;

Why not just add a comment? Adding FIXMEs makes the patch look incomplete to me.

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
