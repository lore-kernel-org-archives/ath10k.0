Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihiaX-0006zR-7d
 for ath10k@lists.infradead.org; Wed, 18 Dec 2019 23:18:42 +0000
Subject: Re: [RESEND] ath10k: add tx hw 802.11 encapusaltion offloading support
References: <20191216092207.31032-1-john@phrozen.org>
 <20191217153000.76AB1C4479C@smtp.codeaurora.org>
 <CAKR_QVJVfqid8i5PXj3Yg8VJjht=MF2fZg+twkLgEkKuMB2bbQ@mail.gmail.com>
 <CAKR_QVJ1PhCHfAO5Rp6pm-wjAO-HcZiq-9Lw67FzBFO5jjYtbA@mail.gmail.com>
From: John Crispin <john@phrozen.org>
Message-ID: <d2e4207c-1cd6-198e-84df-21496f0be378@phrozen.org>
Date: Thu, 19 Dec 2019 00:18:32 +0100
MIME-Version: 1.0
In-Reply-To: <CAKR_QVJ1PhCHfAO5Rp6pm-wjAO-HcZiq-9Lw67FzBFO5jjYtbA@mail.gmail.com>
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Tom Psyborg <pozega.tomislav@gmail.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 18/12/2019 23:45, Tom Psyborg wrote:
> ccing Johannes Berg since upstream change (mac80211-next) breaks build:
> 
> In the commit log its written: remove SUPPORTS_80211_ENCAP HW flag
> 
> Any sane reasons for doing that? mac80211 fails to build because of
> removed flags, this is on backports-5.3-rc4
> 
> Other than that the feature delivers the promised:
> QCA9880 iperf between wired and wireless machine
> native mode 449Mbps
> ethernet mode 522Mbps
> 

superseded due to johill's fixup of the patch, new version coming up
	John

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
