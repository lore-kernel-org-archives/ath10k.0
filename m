Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d9BJT-00082G-KW
 for ath10k@lists.infradead.org; Fri, 12 May 2017 14:13:01 +0000
Subject: Re: [v2,1/3] ath9k: Support channels in licensed bands
References: <20170323133048.30062-2-sw@simonwunderlich.de>
 <1811221.G4Vz0DPyQ8@prime>
 <12133a0e-b030-5b21-8de1-3bf7334d47df@fit.fraunhofer.de>
 <1863250.VEhGCjvYY0@prime> <87efvvvd0t.fsf@kamboji.qca.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <1c5720d5-8264-26a8-a63e-b225524471cc@candelatech.com>
Date: Fri, 12 May 2017 07:12:36 -0700
MIME-Version: 1.0
In-Reply-To: <87efvvvd0t.fsf@kamboji.qca.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>, Simon Wunderlich <sw@simonwunderlich.de>
Cc: Julian Calaby <julian.calaby@gmail.com>, linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com, ath10k@lists.infradead.org, Steve deRosier <derosier@gmail.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>



On 05/11/2017 04:38 AM, Kalle Valo wrote:
> Simon Wunderlich <sw@simonwunderlich.de> writes:
>
>> it seems like there was some discussion here and I wouldn't expect too many
>> more opinions ... do you think we can have a decision based on what has been
>> discussed here?
>
> Well, there was an excellent reply from Steve and quite a few "in my
> opinion this is safe" type of answers. [1] But bluntly said it does not
> really matter what we (the engineers) think. What really matters here
> are regulatory authorities' opinions and rulings. In that respect here
> are few items I want to point out:
>
> o I suspect that from someone's, who is not familiar with software
>   engineering, point of view there is still quite a diffference from
>   modifiying source code or just enabling few options from Kconfig with
>   a custom regdb rule.

If someone with real authority ever complains, then the code could be
backed out again.  Your opinion seems not much more informed than the
rest of us discussing this.

>
> o I don't know about other countries, but in Finland applying for any
>   type of license (even if just to a license to drive a moped) needs
>   both time and money. So there is significant effort anyway needed to
>   legally use this band. And how many users there really are is unclear.

This is almost certainly not going to be used by regular end-users.  It is going to be
used by public safety organizations who are buying equipment from companies
using open-wrt, LEDE, or similar, or possibly small teams at public safety
organizations doing the work themselves.  Rather than having each of these vendors
hack their own crap into their kernels or forcing the the organizations to use Cisco gear,
we could work on it together.

Anyway, if upstream is blocked, then maybe we could work on getting this into LEDE?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
