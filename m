Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8PgU-0008VN-BN
 for ath10k@lists.infradead.org; Thu, 12 Sep 2019 14:02:56 +0000
Received: by mail-qt1-x842.google.com with SMTP id j10so29643784qtp.8
 for <ath10k@lists.infradead.org>; Thu, 12 Sep 2019 07:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <1567679893-14029-1-git-send-email-wgong@codeaurora.org>
 <1567679893-14029-2-git-send-email-wgong@codeaurora.org>
 <87muf9k4pq.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87muf9k4pq.fsf@kamboji.qca.qualcomm.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 12 Sep 2019 22:02:41 +0800
Message-ID: <CANMq1KDWN3NAuNh98QTgELqetyGQEGOkz90xeRNi74d==gU6Tg@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] ath10k: adjust skb length in
 ath10k_sdio_mbox_rx_packet
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Claire Chang <tientzu@chromium.org>, "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

On Thu, Sep 12, 2019 at 9:46 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Wen Gong <wgong@codeaurora.org> writes:
>
> > From: Nicolas Boichat <drinkcat@chromium.org>
> [...]
>
> I simplified the error handling in this function to follow the ath10k
> style, please check carefully that I didn't create any bugs:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6e4d2cc5

Thanks, that looks right.

> --
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
