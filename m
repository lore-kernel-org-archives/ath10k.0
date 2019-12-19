Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iht65-00046Y-GE
 for ath10k@lists.infradead.org; Thu, 19 Dec 2019 10:31:58 +0000
Received: by mail-ot1-x342.google.com with SMTP id 77so6653337oty.6
 for <ath10k@lists.infradead.org>; Thu, 19 Dec 2019 02:31:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <d24c7821-4e5e-28b5-5d1d-f076cfd762fc@newmedia-net.de>
References: <20191216092207.31032-1-john@phrozen.org>
 <20191217153000.76AB1C4479C@smtp.codeaurora.org>
 <CAKR_QVJVfqid8i5PXj3Yg8VJjht=MF2fZg+twkLgEkKuMB2bbQ@mail.gmail.com>
 <CAKR_QVJ1PhCHfAO5Rp6pm-wjAO-HcZiq-9Lw67FzBFO5jjYtbA@mail.gmail.com>
 <d24c7821-4e5e-28b5-5d1d-f076cfd762fc@newmedia-net.de>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Thu, 19 Dec 2019 11:31:56 +0100
Message-ID: <CAKR_QVLKfoo15EqszGSZ9zf6YnfEkih9=PeB0d92k3i0SJZfxQ@mail.gmail.com>
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
To: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>

On 19/12/2019, Sebastian Gottschall <s.gottschall@newmedia-net.de> wrote:
>
> Am 18.12.2019 um 23:45 schrieb Tom Psyborg:
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
> johns patch does not work for qca9880 wave 1 chipsets. it works only for
> 10.4 firmares like 9984, ipq40xx  etc. the 9880 has no benefit from it
> and has no effect.
>
> so your test seem to have false results
>
> Sebastian
>
>>
>

no way. check that you applied code correctly and enabled ethernetmode
parameter. iperf or ping also wouldn't start from wired machine in
ethernetmode unless pinged from wireless machine first

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
