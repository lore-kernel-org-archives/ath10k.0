Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iB94z-00058B-Ri
 for ath10k@lists.infradead.org; Fri, 20 Sep 2019 02:55:31 +0000
Subject: RE: [PATCH v3] ath10k: support NET_DETECT WoWLAN feature
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Fri, 20 Sep 2019 02:55:08 +0000
Message-ID: <40854e84bd4b4a9699b60530b1c373ad@aptaiexm02f.ap.qualcomm.com>
References: <1534402113-14337-1-git-send-email-wgong@codeaurora.org>
 <20181114225910.GA220599@google.com>
 <CA+ASDXMh7vdfkA5jtJqWEU-g-4Ta5Xvy046zujyASZcESCGhAQ@mail.gmail.com>
 <87woe5aehr.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87woe5aehr.fsf@kamboji.qca.qualcomm.com>
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
To: "kvalo@codeaurora.org" <kvalo@codeaurora.org>, Brian Norris <briannorris@chromium.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Kalle Valo
> Sent: Wednesday, September 18, 2019 10:03 PM
> To: Brian Norris <briannorris@chromium.org>
> Cc: linux-wireless <linux-wireless@vger.kernel.org>; Linux Kernel <linux-
> kernel@vger.kernel.org>; ath10k@lists.infradead.org; Wen Gong
> <wgong@codeaurora.org>
> Subject: [EXT] Re: [PATCH v3] ath10k: support NET_DETECT WoWLAN feature
> 
> So essentially the problem is that with firmwares supporting both
> WMI_SERVICE_NLO and WMI_SERVICE_SPOOF_MAC_SUPPORT ath10k
> enables
> NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR, but
> NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR is not enabled
> which is
> inconsistent from user space point of view. Is my understanding correct?
> 
> Wen, can you enable NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR?
> Does firmware
> support that?

Yes, I test again, it is enabled NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR now.

> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
