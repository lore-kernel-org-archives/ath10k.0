Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVRun-0004Qe-Tx
 for ath10k@lists.infradead.org; Tue, 28 May 2019 02:32:39 +0000
Received: by mail-qk1-x743.google.com with SMTP id m14so1241650qka.10
 for <ath10k@lists.infradead.org>; Mon, 27 May 2019 19:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <1558506776-19702-1-git-send-email-wgong@codeaurora.org>
 <CALiNf28PQFtAM6uZVPhh-_ASnYeeAtm8kWpP0b8k_P6zGwxbcQ@mail.gmail.com>
In-Reply-To: <CALiNf28PQFtAM6uZVPhh-_ASnYeeAtm8kWpP0b8k_P6zGwxbcQ@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 28 May 2019 10:32:25 +0800
Message-ID: <CANMq1KDgafzxyVc6H6i0OtKW32T2mpMSp4di81qNChDv-5RBKw@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: add support for firmware crash recovery on
 SDIO chip
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
To: Claire Chang <tientzu@google.com>
Cc: "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Change to the interrupt handler since v1 sounds good to me.

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

On Thu, May 23, 2019 at 4:53 PM Claire Chang <tientzu@google.com> wrote:
>
> Tested-by: Claire Chang <tientzu@chromium.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
