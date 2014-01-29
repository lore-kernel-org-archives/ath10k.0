Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8YFb-0001Gk-K5
 for ath10k@lists.infradead.org; Wed, 29 Jan 2014 16:44:32 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <52E7F4F2.2030001@candelatech.com>
 <CAHqTa-2JvvRA2v3y5YF8ku02zwxzpotGDQqOUU2FkxzkQgeBAg@mail.gmail.com>
Date: Wed, 29 Jan 2014 18:44:02 +0200
In-Reply-To: <CAHqTa-2JvvRA2v3y5YF8ku02zwxzpotGDQqOUU2FkxzkQgeBAg@mail.gmail.com>
 (Avery Pennarun's message of "Tue, 28 Jan 2014 13:34:59 -0500")
Message-ID: <87wqhizqjx.fsf@kamboji.qca.qualcomm.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

Avery Pennarun <apenwarr@gmail.com> writes:

> On Tue, Jan 28, 2014 at 1:20 PM, Ben Greear <greearb@candelatech.com> wrote:
>> On 01/28/2014 09:18 AM, Avery Pennarun wrote:
>>> When the ath10k firmware crashes on my device (let's not worry about
>>> why the firmware crashes right now; one problem at a time), my host
>>> CPU (ARMv7 based) can't recover.  I get some variant of this error:
>>
>> I don't know about your pci bus problem, but I'm interested in knowing
>> about firmware crashes (if you are at liberty to share the details).
>
> Well, since you asked... :)
>
> I'm trying to build an especially robust system here, so when I
> noticed that the driver will bring the entire system crashing down
> upon a firmware crash, I've actually gone out of my way to make more
> firmware crashes.

Do you know that we have simulate_fw_crash debugfs file just for testing
this? Of course it's good to test various firmware crashing scenarious,
but in some cases this debugfs file helps a lot.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
