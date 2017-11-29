Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x233.google.com ([2607:f8b0:400d:c0d::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eK5f8-0001oZ-Gn
 for ath10k@lists.infradead.org; Wed, 29 Nov 2017 16:56:44 +0000
Received: by mail-qt0-x233.google.com with SMTP id a16so5192911qtj.3
 for <ath10k@lists.infradead.org>; Wed, 29 Nov 2017 08:56:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87h8tg6y2t.fsf@kamboji.qca.qualcomm.com>
References: <CAGT1WQM6uiP6GHW9ukNUPf+JcZckENz514gg0DiR7CCO=5K+Fg@mail.gmail.com>
 <87zi7da458.fsf@kamboji.qca.qualcomm.com>
 <CAGT1WQO9y89Wz250zZs2qqGv7rut5C82Ncd4=XOKCLthnYrC3w@mail.gmail.com>
 <87h8tg6y2t.fsf@kamboji.qca.qualcomm.com>
From: Konstantin Bogomolov <konstantin.bogomolov@dejero.com>
Date: Wed, 29 Nov 2017 11:56:20 -0500
Message-ID: <CAGT1WQOGi2Aq2d1e-YhdCxZCK5oqF2Dzu3fpjkz2fqRDAVn11A@mail.gmail.com>
Subject: Re: Kernel panic hosting 5Ghz AP
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

I've been trying to reproduce the issue on 4.14.1 for a few days now,
and it seems to have been stable so far (using ACS).

I should mention that I've been reproducing this using a torture test
where I first start a 2.4 Ghz AP, take it down, then start a 5 Ghz AP
(twice), then reboot and try again.

I am not sure whether starting the 2.4 Ghz AP before the other one
exacerbates the issue or not. Running the torture test on my 4.1
kernel (with 4.12 backports) worked for a while, until the kernel
crash happened, at which point starting the 5 Ghz AP led to a kernel
crash every time. On the stock Debian 4.9 kernel, it never worked and
crashed right away, until I tested it again after my 4.14.1 tests --
at which point it seemed to work.

So from what I've observed, the crash does not manifest itself right
away, but once it happens once, it continues happening without fail on
the subsequent tries. Having said that, 4.14.1 seems to be working
well considering its been ~5 days of running the torture test, whereas
4.1 (with 4.12 backports) crashed within 1-2 days.

Konstantin

On Mon, Nov 27, 2017 at 1:21 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Konstantin Bogomolov <konstantin.bogomolov@dejero.com> writes:
>
>> Hello Kalle,
>>
>> The panic happens after hostapd outputs "ACS-STARTED". Usually, the
>> first attempt for me to start hostapd fails to create the AP (I think
>> this is a separate issue with the 5Ghz AP), but the second attempt
>> always initiates a panic on Debian 4.9 drivers.
>>
>> I don't think this is a regression, because I saw the same behaviour
>> on a custom 4.1 kernel. I have also tried using backported drivers
>> from 4.12.0 to both 4.1 and 4.9, where the panic was also reproducible
>> on the second hostapd attempt, but didn't happen every time as it does
>> on Debian 4.9. So the AP did work on some occasions using the
>> backports, but the panic still happened very frequently. Sadly I don't
>> have logs at this time using those backports.
>>
>> I'll try and reproduce this using a recent kernel and let you know the results.
>
> Also try without ACS (meaning specify a channel mannually hostapd config
> file) just to see if the crash is ACS related.
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
