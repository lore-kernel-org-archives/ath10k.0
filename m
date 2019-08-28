Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2pVW-0004Zt-6g
 for ath10k@lists.infradead.org; Wed, 28 Aug 2019 04:24:32 +0000
Subject: RE: [PATCH 4/7] ath10k: disable TX complete indication of htt for sdio
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Wed, 28 Aug 2019 04:24:19 +0000
Message-ID: <7975595590134eb298cf3c0ea17aa4b1@aptaiexm02f.ap.qualcomm.com>
References: <1566302108-18219-1-git-send-email-wgong@codeaurora.org>
 <1566302108-18219-5-git-send-email-wgong@codeaurora.org>
 <CANMq1KDo1xur9M7+XgNWkdarJOQfu9_Ofk=G5ajypWpq00e9=A@mail.gmail.com>
In-Reply-To: <CANMq1KDo1xur9M7+XgNWkdarJOQfu9_Ofk=G5ajypWpq00e9=A@mail.gmail.com>
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
> Sent: Tuesday, August 27, 2019 3:56 PM
> To: Wen Gong <wgong@codeaurora.org>
> Cc: open list:NETWORKING DRIVERS (WIRELESS) <linux-
> wireless@vger.kernel.org>; ath10k@lists.infradead.org
> Subject: [EXT] Re: [PATCH 4/7] ath10k: disable TX complete indication of htt
> for sdio
> 
> On Tue, Aug 20, 2019 at 7:55 PM Wen Gong <wgong@codeaurora.org> wrote:
> >
> > Tx complete message from firmware cost bus bandwidth of sdio, and bus
> > bandwidth is the bollteneck of throughput, it will effect the bandwidth
> > occupancy of data packet of TX and RX.
> >
> > This patch disable TX complete indication from firmware for htt data
> > packet, it results in significant performance improvement on TX path.
> >
Patch v2 sent with the changes, https://patchwork.kernel.org/patch/11116685/

> >
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
