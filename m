Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x233.google.com ([2a00:1450:4010:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqQ7S-0004US-1j
 for ath10k@lists.infradead.org; Thu, 07 May 2015 18:01:58 +0000
Received: by lagv1 with SMTP id v1so36418501lag.3
 for <ath10k@lists.infradead.org>; Thu, 07 May 2015 11:01:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAD1M0618J5LX9-6CtRHfunNJD+4F0yaBAaDNi62H8z9e_3DryQ@mail.gmail.com>
References: <CAMCCUbgZRhNCWTQkspCuRdCTQy6SpmihEKFHfY8ija4+zYTLiw@mail.gmail.com>
 <CAD1M0618J5LX9-6CtRHfunNJD+4F0yaBAaDNi62H8z9e_3DryQ@mail.gmail.com>
Date: Thu, 7 May 2015 20:01:35 +0200
Message-ID: <CAMCCUbjs+ZYAm705=KhG=cpwnfAV7UthVCrZfXfmWKQ8TjWpgg@mail.gmail.com>
Subject: Re: Cannot achieve throughput higher than 460Mbps using CT firmware
 and 3x3 ath10k
From: richard mayers <richard.mayers92@gmail.com>
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
To: Pushpal Sidhu <psidhu@gateworks.com>, ath10k@lists.infradead.org

Its only 30% of CPU usage when I am transmit at maximum speed. May be
I am not checking it correctly, I just use top and then press 1 and it
splits the cores (it has only 2). In the worst case if 30% was the
average it should be a maximum of 60% in one single core.

Richard.

2015-05-07 19:00 GMT+02:00 Pushpal Sidhu <psidhu@gateworks.com>:
> On Wed, May 6, 2015 at 8:01 AM, richard mayers
> <richard.mayers92@gmail.com> wrote:
>> Hi all,
>>
>> The maximum throughput I get with the following set up is around
>> 460-470Mbits/s when using MCS 6, 80MHz channel and 3 spatial streams.
>> However, when I try MCS 7, the throughput drops to 200Mbits/s, and
>> when I use 8 or 9 it goes to 0. The signal level is -11dBm which I
>> guess is quite good.
>>
>> Do you have any indications of what I do wrong and cannot get 600Mbps
>> throughput, as mention in previous messages in this list? Any help is
>> highly appreciated.
>>
>> My set up is as follows:
>>
>> - STA: compex wle900vx (QCA988x), ubuntu 14.04 LTS, dell dual core
>> 1.66ghz, kernel version 3.16, driver backport 4.0.1 and as a firmware
>> the commercial firmware from Candela Tech (
>> 10.4.467-ct-com-full-013-b5b14a).
>
> Honestly, I think it's your CPU. Run top while doing your throughput
> test, and I think you'll see 100% sirq (pegged CPU core). Also make
> sure you split the CPU's up so you're not looking at the 'total' cpu
> count.
>
> - Pushpal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
