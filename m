Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XeNT8-0004hG-5t
 for ath10k@lists.infradead.org; Wed, 15 Oct 2014 12:14:19 +0000
Received: by mail-wi0-f182.google.com with SMTP id n3so1698801wiv.9
 for <ath10k@lists.infradead.org>; Wed, 15 Oct 2014 05:13:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <025801cfe6de$2d4c7f70$87e57e50$@acksys.fr>
References: <773DB8A82AB6A046AE0195C68612A319018C2750@sbs2003.acksys.local>
 <CA+BoTQ=a8kY0CGGKHwRhk4cg=V0oimipuht6Pkc0K0x4WMMn-A@mail.gmail.com>
 <024a01cfe6c7$5e427dd0$1ac77970$@acksys.fr>
 <CA+BoTQkaKXNfprRwGrQq6rKOZWvANNRrcmgU-iVdw1bONTA--w@mail.gmail.com>
 <025801cfe6de$2d4c7f70$87e57e50$@acksys.fr>
Date: Wed, 15 Oct 2014 14:13:50 +0200
Message-ID: <CACKGw+H1QSvAL0Ri3HT6E_rhw=DhzDwj1XEeqwjwFkzJVQpz9Q@mail.gmail.com>
Subject: Re: ath10k firmware crash
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
To: voncken <cedric.voncken@acksys.fr>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, ath10k <ath10k@lists.infradead.org>

On 13 October 2014 14:06, voncken <cedric.voncken@acksys.fr> wrote:
>> >
>> > Have you a benchmark reference with ATH10K ? at this time we can send
>> around 700 Mbit/s, is it the maximum or we can expected better ?
>>
>> If this is OTA then this is pretty good. If this is cabled RF w/ attentuator
>> it should be possible to get ~900mbps of UDP traffic with multiple streams on
>> iperf. At least that's what I was getting on 10.1 firmware (on both AP and
>> STA) last time I checked.
>>
>> Getting more than 700mbps OTA requires AP and STA antenna alignment voodoo.
>>
> I did some tests with a linksys WRT1900AC and I have ~950 mbps OTA easily.

You mean ath10k (STA) VS WRT1900AC get up ~950mbps?
If so, could you say what's the HW, FW version you use?

-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
