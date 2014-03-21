Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR2LJ-0003GG-6P
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 16:30:49 +0000
Message-ID: <532C6921.5080803@candelatech.com>
Date: Fri, 21 Mar 2014 09:30:25 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: add the Rx rate in FW stats
References: <1395396014-24631-1-git-send-email-yeohchunyeow@gmail.com>
 <CA+BoTQ=X=UxikrVrmr3hyQgjN2Tg5aeW5Ok7b+23n9X6bxRshA@mail.gmail.com>
 <87a9cja596.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87a9cja596.fsf@kamboji.qca.qualcomm.com>
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
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 03/21/2014 09:25 AM, Kalle Valo wrote:
> Michal Kazior <michal.kazior@tieto.com> writes:
> 
>> The main problem here is there are subtle yet crazy binary
>> incompatibilities between these firmwares.
>>
>> The best way would probably be to implement wmi as an abstraction
>> layer with completely different backends for different firmware
>> branches/revisions. Otherwise you sign up for some pain..
> 
> Yeah, I'm starting to believe that we will need something like that.
> Other option is just to duplicate wmi.c and wmi.h for each interface
> version. More code, but we get to keep more hair ;)
> 
> But we need to talk a lot more about this. For this patch in question we
> should be able to manage with the current method of handling
> differences.

Lets not duplicate any more code than we have to.  Hopefully we can
get a solid firmware built that everyone can use and let the old firmware
support eventually go away.  In the meantime, we can add hacks as needed
to deal with firmware differences.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
