Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0180.hostedemail.com ([216.40.44.180]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNR6y-0007Ik-R1
 for ath10k@lists.infradead.org; Tue, 11 Mar 2014 18:09:09 +0000
Message-ID: <1394561322.20021.5.camel@joe-AO722>
Subject: Re: [PATCH] ath10k: unify warning messages in mac.c
From: Joe Perches <joe@perches.com>
Date: Tue, 11 Mar 2014 11:08:42 -0700
In-Reply-To: <531F4E3F.3020606@candelatech.com>
References: <20140303154327.1290.67278.stgit@potku.adurom.net>
 <CA+BoTQmQndikH5uPDwBpstp9KmcD3tmHSGP5NpEreYEOtRm0sw@mail.gmail.com>
 <8761nv44nd.fsf@kamboji.qca.qualcomm.com>
 <87k3c1gf35.fsf@kamboji.qca.qualcomm.com>
 <531F49F2.3030408@candelatech.com> <1394559971.20021.1.camel@joe-AO722>
 <531F4E3F.3020606@candelatech.com>
Mime-Version: 1.0
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
To: Ben Greear <greearb@candelatech.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, 2014-03-11 at 10:56 -0700, Ben Greear wrote:
> the driver may want to always show some interesting
> thing and so put it at KERN_ERR when in fact is not a real error

I think that's bad policy.

> that the user should be concerned about (think firmware version,
> for instance)

KERN_INFO is exactly for that.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
