Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1JRc-0000jg-4k
 for ath10k@lists.infradead.org; Mon, 22 Jul 2013 16:58:48 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: add ath10k
References: <20130722093113.26562.11543.stgit@localhost6.localdomain6>
 <20130722093220.26562.14270.stgit@localhost6.localdomain6>
 <1374504278.2061.35.camel@joe-AO722>
Date: Mon, 22 Jul 2013 19:58:11 +0300
In-Reply-To: <1374504278.2061.35.camel@joe-AO722> (Joe Perches's message of
 "Mon, 22 Jul 2013 07:44:38 -0700")
Message-ID: <87zjtewmzg.fsf@kamboji.qca.qualcomm.com>
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
To: Joe Perches <joe@perches.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Joe Perches <joe@perches.com> writes:

> On Mon, 2013-07-22 at 12:32 +0300, Kalle Valo wrote:
>> I forgot to add an entry to MAINTAINERS when submitting the driver.
> []
>> diff --git a/MAINTAINERS b/MAINTAINERS
> []
>> +QUALCOMM ATHEROS ATH10K WIRELESS DRIVER
>
> It's odd to not find ATH6KL next to ATH10K.

I was wondering the same, but decided to put the entries in alphabetical
order still.

> Maybe it's time to rename all the ATH sections
> to make them QUALCOMM?

Maybe, but does it really matter? Changing the MAINTAINERS file just
creates unnecessary conficts for git merges.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
