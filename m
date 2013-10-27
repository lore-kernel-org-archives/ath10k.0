Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x236.google.com ([2a00:1450:400c:c00::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VaNWA-00055g-GZ
 for ath10k@lists.infradead.org; Sun, 27 Oct 2013 10:24:23 +0000
Received: by mail-wg0-f54.google.com with SMTP id c11so5555240wgh.9
 for <ath10k@lists.infradead.org>; Sun, 27 Oct 2013 03:23:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACKGw+FE7YnqaxuSQY=GLm7chYHcEn+L5Lr_jv6uGUSRReYBbg@mail.gmail.com>
References: <CAPqRyK90OeJi_UVGV6V2SLFK0KZvc3Y9GkFgrOaNQYRNWeOMGA@mail.gmail.com>
 <CACKGw+FE7YnqaxuSQY=GLm7chYHcEn+L5Lr_jv6uGUSRReYBbg@mail.gmail.com>
Date: Sun, 27 Oct 2013 11:23:56 +0100
Message-ID: <CACKGw+FPXvqApQ20WZmnyYRGiEWkaWZ4VK7-qmbeOnsC1WXy5g@mail.gmail.com>
Subject: Re: 80 MHz support
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
To: Phil Moora <phil.moora@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 27 October 2013 08:36, Bartosz Markowski <bartosz.markowski@tieto.com> wrote:
> On 27 October 2013 06:42, Phil Moora <phil.moora@gmail.com> wrote:
>> Hello all,
>>
>> Does ath10k provide 80 MHz channel support? I am using Compex
>> WLE900N5-18 miniPCIe (hw2) on latest ath10k-master branch. Everything
>> works fine but I can not make the card work on 80 MHz channel width.
>
> Yes, it does.
>
>> I am trying to connect to a 80 MHz AP, but my card remains in 40 MHz.
>> Throughput tests reveal that it is indeed in 40 MHz.
>>
>> Any suggestions? Any changes required to unlock 80 MHz?
>
> Please check your regulatory domain settings.
> An option may be to use custom db.txt (CONFIG_CFG80211_INTERNAL_REGDB)

VHT80 regdb changes are already availabe here:
http://git.kernel.org/cgit/linux/kernel/git/linville/wireless-regdb.git.
If your problem with 80MHz channels is due to outdated regdb, it's
better to fetch the latest from there.

-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
