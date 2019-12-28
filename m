Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1il2f9-0007DQ-U0
 for ath10k@lists.infradead.org; Sat, 28 Dec 2019 03:21:13 +0000
Received: by mail-ot1-x344.google.com with SMTP id 59so38598662otp.12
 for <ath10k@lists.infradead.org>; Fri, 27 Dec 2019 19:21:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <d2e4207c-1cd6-198e-84df-21496f0be378@phrozen.org>
References: <20191216092207.31032-1-john@phrozen.org>
 <20191217153000.76AB1C4479C@smtp.codeaurora.org>
 <CAKR_QVJVfqid8i5PXj3Yg8VJjht=MF2fZg+twkLgEkKuMB2bbQ@mail.gmail.com>
 <CAKR_QVJ1PhCHfAO5Rp6pm-wjAO-HcZiq-9Lw67FzBFO5jjYtbA@mail.gmail.com>
 <d2e4207c-1cd6-198e-84df-21496f0be378@phrozen.org>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Sat, 28 Dec 2019 04:21:10 +0100
Message-ID: <CAKR_QVJE6c-VTR-rGdBUt08ijt=w2rCRjeNQ2+=E6ZQ6_N+g=Q@mail.gmail.com>
Subject: Re: [RESEND] ath10k: add tx hw 802.11 encapusaltion offloading support
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
To: John Crispin <john@phrozen.org>
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 19/12/2019, John Crispin <john@phrozen.org> wrote:
> On 18/12/2019 23:45, Tom Psyborg wrote:
>> ccing Johannes Berg since upstream change (mac80211-next) breaks build:
>>
>> In the commit log its written: remove SUPPORTS_80211_ENCAP HW flag
>>
>> Any sane reasons for doing that? mac80211 fails to build because of
>> removed flags, this is on backports-5.3-rc4
>>
>> Other than that the feature delivers the promised:
>> QCA9880 iperf between wired and wireless machine
>> native mode 449Mbps
>> ethernet mode 522Mbps
>>
>
> superseded due to johill's fixup of the patch, new version coming up
> 	John
>

in case it doesn't fix up scan crash i can provide more details.

triggering scan (from luci at least) would always crash the driver
unless vdev was already started, right after the message: mac create
vdev 0 map ffff

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
