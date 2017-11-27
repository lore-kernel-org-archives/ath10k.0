Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eJCo3-0004kR-9w
 for ath10k@lists.infradead.org; Mon, 27 Nov 2017 06:22:51 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Kernel panic hosting 5Ghz AP
Date: Mon, 27 Nov 2017 06:21:47 +0000
Message-ID: <87h8tg6y2t.fsf@kamboji.qca.qualcomm.com>
References: <CAGT1WQM6uiP6GHW9ukNUPf+JcZckENz514gg0DiR7CCO=5K+Fg@mail.gmail.com>
 <87zi7da458.fsf@kamboji.qca.qualcomm.com>
 <CAGT1WQO9y89Wz250zZs2qqGv7rut5C82Ncd4=XOKCLthnYrC3w@mail.gmail.com>
In-Reply-To: <CAGT1WQO9y89Wz250zZs2qqGv7rut5C82Ncd4=XOKCLthnYrC3w@mail.gmail.com>
 (Konstantin Bogomolov's message of "Thu, 23 Nov 2017 11:41:54 -0500")
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
To: Konstantin Bogomolov <konstantin.bogomolov@dejero.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Konstantin Bogomolov <konstantin.bogomolov@dejero.com> writes:

> Hello Kalle,
>
> The panic happens after hostapd outputs "ACS-STARTED". Usually, the
> first attempt for me to start hostapd fails to create the AP (I think
> this is a separate issue with the 5Ghz AP), but the second attempt
> always initiates a panic on Debian 4.9 drivers.
>
> I don't think this is a regression, because I saw the same behaviour
> on a custom 4.1 kernel. I have also tried using backported drivers
> from 4.12.0 to both 4.1 and 4.9, where the panic was also reproducible
> on the second hostapd attempt, but didn't happen every time as it does
> on Debian 4.9. So the AP did work on some occasions using the
> backports, but the panic still happened very frequently. Sadly I don't
> have logs at this time using those backports.
>
> I'll try and reproduce this using a recent kernel and let you know the results.

Also try without ACS (meaning specify a channel mannually hostapd config
file) just to see if the crash is ACS related.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
