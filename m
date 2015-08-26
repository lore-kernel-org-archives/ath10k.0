Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUXGI-0003iV-Gf
 for ath10k@lists.infradead.org; Wed, 26 Aug 2015 09:44:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH/RFT 0/2] ath10k: add qca6164 support
References: <1439469147-9408-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQ=STQ2jpMCjP7V=soPk=e4BMuq+3bO_F0UXK_EuJFqxfQ@mail.gmail.com>
 <1901727.3ECHUBE5WW@wuerfel> <1523365.YtEF2Ft7XC@wuerfel>
Date: Wed, 26 Aug 2015 12:44:25 +0300
In-Reply-To: <1523365.YtEF2Ft7XC@wuerfel> (Arnd Bergmann's message of "Tue, 25
 Aug 2015 20:24:57 +0200")
Message-ID: <87bndu1j0m.fsf@kamboji.qca.qualcomm.com>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Anish Tondwalkar <twilightrook@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Oscar Rydberg <oscarrydberg@gmail.com>, Michal Kazior <michal.kazior@tieto.com>, Joseph Salisbury <joseph.salisbury@canonical.com>, Victor van Poppelen <vvanpo@gmail.com>

Arnd Bergmann <arnd@arndb.de> writes:

> On Tuesday 25 August 2015 15:47:45 Arnd Bergmann wrote:
>> On Tuesday 25 August 2015 15:09:45 Michal Kazior wrote:
>> > 
>> > This is some weird regression with MSI ranges and we still haven't
>> > figured this out.
>> > 
>> > For the time being add "irq_mode=1" parameter when loading ath10k_pci
>> > module, please.
>> 
>> Ok, that gets the device to show up without errors. I have no
>> time to test whether I can actually use it at the moment, will
>> report back later.
>
> I tested some more and everything seems fine now when using legacy
> interrupts. Thanks for all the work that went into this, I hope
> the patch can make it into 4.3.

I'm planning to send a pull request to Dave later today so this patch
should make it to 4.3. Sorry for taking so long to fix this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
