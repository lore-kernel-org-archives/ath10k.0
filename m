Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNQut-0006tn-Mm
 for ath10k@lists.infradead.org; Tue, 11 Mar 2014 17:56:40 +0000
Message-ID: <531F4E3F.3020606@candelatech.com>
Date: Tue, 11 Mar 2014 10:56:15 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: unify warning messages in mac.c
References: <20140303154327.1290.67278.stgit@potku.adurom.net>
 <CA+BoTQmQndikH5uPDwBpstp9KmcD3tmHSGP5NpEreYEOtRm0sw@mail.gmail.com>
 <8761nv44nd.fsf@kamboji.qca.qualcomm.com>
 <87k3c1gf35.fsf@kamboji.qca.qualcomm.com> <531F49F2.3030408@candelatech.com>
 <1394559971.20021.1.camel@joe-AO722>
In-Reply-To: <1394559971.20021.1.camel@joe-AO722>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 03/11/2014 10:46 AM, Joe Perches wrote:
> On Tue, 2014-03-11 at 10:37 -0700, Ben Greear wrote:
>> but I would also suggest giving user a clue as to the
>> severity.  Something starting with 'failed' or 'warning' is pretty obvious.
> 
> Isn't that the whole point of KERN_<LEVEL>?
> 
> I think duplicating it is pointless.

Normal users use dmesg or cat /var/log/messages.  The KERN_LEVEL is
not immediately obvious there (at least on my Fedora systems).

And either way, the driver may want to always show some interesting
thing and so put it at KERN_ERR when in fact is not a real error
that the user should be concerned about (think firmware version,
for instance)

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
