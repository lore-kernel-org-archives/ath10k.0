Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3X1y-0000an-R2
 for ath10k@lists.infradead.org; Fri, 30 Aug 2019 02:52:56 +0000
Subject: RE: [PATCH v2 7/7] ath10k: enable napi on RX path for sdio
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Fri, 30 Aug 2019 02:52:51 +0000
Message-ID: <dd7f7cd664e64ee59965117ffd7c2c7e@aptaiexm02f.ap.qualcomm.com>
References: <1566903707-27536-1-git-send-email-wgong@codeaurora.org>
 <1566903707-27536-8-git-send-email-wgong@codeaurora.org>
 <CANMq1KCQZCOw8kHn2MJfAT9fWoLCmz2jFWqHzd=9QOgZ7MeaXQ@mail.gmail.com>
In-Reply-To: <CANMq1KCQZCOw8kHn2MJfAT9fWoLCmz2jFWqHzd=9QOgZ7MeaXQ@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: Nicolas Boichat <drinkcat@chromium.org>, Wen Gong <wgong@codeaurora.org>
Cc: "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Nicolas
> Boichat
> Sent: Wednesday, August 28, 2019 1:40 PM
> To: Wen Gong <wgong@codeaurora.org>
> Cc: open list:NETWORKING DRIVERS (WIRELESS) <linux-
> wireless@vger.kernel.org>; ath10k@lists.infradead.org
> Subject: [EXT] Re: [PATCH v2 7/7] ath10k: enable napi on RX path for sdio
> 
Changed and v3 sent, https://patchwork.kernel.org/patch/11122183/

> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
