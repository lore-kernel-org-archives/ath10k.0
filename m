Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0sEk-0003Sn-3X
 for ath10k@lists.infradead.org; Tue, 16 Dec 2014 13:32:27 +0000
Received: by mail-wi0-f179.google.com with SMTP id ex7so12515637wid.6
 for <ath10k@lists.infradead.org>; Tue, 16 Dec 2014 05:32:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALhHN=oTxxeDxym9fDOrH5XLm4pNngBV7tFfxpJ5bYORZnCu=g@mail.gmail.com>
References: <1418719980-19753-1-git-send-email-janusz.dziedzic@tieto.com>
 <CAEFj986SVguSMp=oQ3aNKAv+nZkcYiVSiPupLj8Y6=57YVrSmQ@mail.gmail.com>
 <CALhHN=oTxxeDxym9fDOrH5XLm4pNngBV7tFfxpJ5bYORZnCu=g@mail.gmail.com>
Date: Tue, 16 Dec 2014 21:32:00 +0800
Message-ID: <CAEFj986nX6+GyS0x64veOuEEJsGf-aJFq4aT_ZDxqmPJ=Y3kBg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: fix low TX rates when IBSS and HT
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, Dec 16, 2014 at 7:22 PM, Janusz Dziedzic
<janusz.dziedzic@tieto.com> wrote:
> On 16 December 2014 at 12:10, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>> Hi, Janusz
>>
>> I have applied the three patches and tested with firmware
>> 999.999.0.636 but not working.
>>
>> Any advice what's wrong?
>>
> mac peer 04:f0:21:0c:a5:43 qos 0 - this is suspect.

Not so sure.

> What is your test procedure (I see some mesh ...)?

I named the interface as mesh0 but it is ibss or adhoc mode. I use the
iw util to setup the adhoc interface.

---
ChunYeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
