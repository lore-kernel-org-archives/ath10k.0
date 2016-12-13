Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
From: "Manoharan, Rajkumar" <rmanohar@qca.qualcomm.com>
Subject: RE: ath10k firmware crashes in mesh mode on QCA9880
Date: Tue, 13 Dec 2016 23:51:32 +0000
Message-ID: <ccf17009a52748c99accdaa005ea837a@NALASEXR01H.na.qualcomm.com>
References: <583DD564.8040704@cococorp.com>
 <20161201070908.GB11953@atheros-ThinkPad-T61> <58421FA2.2020004@cococorp.com>
 <20161203124358.GB31861@atheros-ThinkPad-T61>
 <20161203124600.GC31861@atheros-ThinkPad-T61> <5845B325.6060002@cococorp.com>
 <d8eb0ba5828d43dd83030247ba443b88@aphydexm01f.ap.qualcomm.com>
 <58472E7B.7090603@cococorp.com> <58504113.2080702@cococorp.com>
 <5850831D.7020206@cococorp.com>
In-Reply-To: <5850831D.7020206@cococorp.com>
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
To: Benjamin Morgan <bmorgan@cococorp.com>, "Nagarajan, Ashok Raj" <arnagara@qti.qualcomm.com>, Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "lede-dev@lists.infradead.org" <lede-dev@lists.infradead.org>, "agreen@cococorp.com" <agreen@cococorp.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> Tested the 10.2.4.70.59-2 firmware and wpa_supplicant running WITHOUT
> encryption and it still crashes. I suspect this means wpa_supplicant is setting up
> the interface incorrectly and/or transmitting a malformed packet that is causing
> the driver to crash.
> 
Ben,

IIRC mesh support was validated in qca988x in VHT mode while ago.  Either it could
be regression in driver/fw or lede mac80211 package.

1) Could you please try plain backports in lede w/o applying ath10k patches.
     I do see 160MHz support in LEDE.
2) There are some peer stats dump from your earlier log. Disable peer stats 
     by "peer_stats" debugfs.
3) Please confirm the behavior with older firmware revisions.
4) use iw to bring up open mesh to rule out wpa_s config

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
