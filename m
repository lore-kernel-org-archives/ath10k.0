Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-f170.google.com ([209.85.223.170])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dtxlK-0000ji-EJ
 for ath10k@lists.infradead.org; Mon, 18 Sep 2017 15:15:13 +0000
Received: by mail-io0-f170.google.com with SMTP id e189so2912697ioa.4
 for <ath10k@lists.infradead.org>; Mon, 18 Sep 2017 08:14:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1505746857-31938-4-git-send-email-kvalo@qca.qualcomm.com>
References: <1505746857-31938-1-git-send-email-kvalo@qca.qualcomm.com>
 <1505746857-31938-4-git-send-email-kvalo@qca.qualcomm.com>
From: Matteo Croce <mcroce@redhat.com>
Date: Mon, 18 Sep 2017 17:14:04 +0200
Message-ID: <CAGnkfhw1bGxD7Z4B=i_xtRJAD5ph_YxEcW0y2F5RTXfPrDkd0A@mail.gmail.com>
Subject: Re: [PATCH 3/3] Revert "ath10k: QCA988X hw2.0: update firmware to
 10.2.4.70.63-2"
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, linux-firmware@kernel.org

On Mon, Sep 18, 2017 at 5:00 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> This reverts commit c7370e2728c72e5e87f63a48911a925330485a8e.
>
> 10.2.4.70.63-2 was buggy and lots of people have been reporting crashes, Hauke
> Mehrtens among others:
>
> http://lists.infradead.org/pipermail/ath10k/2017-September/010138.html
>
> This reverts the firmware back to 10.2.4.70.54.
> ---
>  WHENCE                              |   2 +-
>  ath10k/QCA988X/hw2.0/firmware-5.bin | Bin 249384 -> 248188 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
>

I can confirm that it crashes on insmod:

https://bugzilla.kernel.org/show_bug.cgi?id=196919

-- 
Matteo Croce
per aspera ad upstream

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
