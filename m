Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJyxM-00083i-13
 for ath10k@lists.infradead.org; Mon, 14 Oct 2019 11:56:09 +0000
Subject: RE: [PATCH v5 0/8] ath10k: improve throughout of tcp/udp TX/RX of sdio
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Mon, 14 Oct 2019 11:53:07 +0000
Message-ID: <048a697517b4459087bae05dce4cc1a4@aptaiexm02f.ap.qualcomm.com>
References: <1567679893-14029-1-git-send-email-wgong@codeaurora.org>
 <87sgon8inp.fsf@codeaurora.org>
 <11062c4e1659ac759cb73af7d46a6db2@codeaurora.org>
 <7f5d822f2dd1f98ba26a8fdecb5dc011@codeaurora.org>
In-Reply-To: <7f5d822f2dd1f98ba26a8fdecb5dc011@codeaurora.org>
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
To: Wen Gong <wgong@codeaurora.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Wen Gong
> Sent: Thursday, September 26, 2019 10:33 AM
> To: kvalo@codeaurora.org
> Cc: linux-wireless@vger.kernel.org; ath10k@lists.infradead.org
> Subject: [EXT] Re: [PATCH v5 0/8] ath10k: improve throughout of tcp/udp
> TX/RX of sdio
> 
> On 2019-09-24 20:32, Wen Gong wrote:
> > On 2019-09-23 17:29, Kalle Valo wrote:
> >> Wen Gong <wgong@codeaurora.org> writes:
> 
> 
> patch v6 ath10k: improve throughout of RX of sdio has sent
> new patch v6 only have 3 patches, the left patches will also sent later
> 
> Alagu Sankar (1):
>    ath10k: enable RX bundle receive for sdio
> 
> Wen Gong (2):
>    ath10k: change max RX bundle size from 8 to 32 for sdio
>    ath10k: add workqueue for RX path of sdio
> 
> https://patchwork.kernel.org/patch/11160247/
> https://patchwork.kernel.org/patch/11160245/
> https://patchwork.kernel.org/patch/11160241/
> 
Left 4 patches sent v6:
https://patchwork.kernel.org/patch/11188393/
https://patchwork.kernel.org/patch/11188403/
https://patchwork.kernel.org/patch/11188405/
https://patchwork.kernel.org/patch/11188407/

> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
