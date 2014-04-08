Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXVPZ-00021k-R3
 for ath10k@lists.infradead.org; Tue, 08 Apr 2014 12:45:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Running throughput tests
References: <00ea01cee403$5331f1e0$f995d5a0$@sparklan.com>
 <006301cefa3c$44c07b50$ce4171f0$@sparklan.com>
 <52AEC26B.2060400@intec.ugent.be>
 <007f01cefa41$8a940de0$9fbc29a0$@sparklan.com>
 <52AEE61F.5030505@intec.ugent.be>
 <006b01cefacb$6c0b2d60$44218820$@sparklan.com>
 <52B00B10.3050300@intec.ugent.be>
 <004b01cefb9d$04a543e0$0defcba0$@sparklan.com>
 <52B2AE75.9050206@intec.ugent.be>
 <00df01cf0090$05944f10$10bced30$@sparklan.com>
 <52B9672E.9000701@intec.ugent.be>
 <008c01cf012e$e59563d0$b0c02b70$@sparklan.com>
 <530A64E5.2040401@intec.ugent.be> <530B0670.1010009@stackframe.org>
 <530E5EF2.8070800@intec.ugent.be>
 <87y50weecb.fsf_-_@kamboji.qca.qualcomm.com>
 <5335910B.3000702@intec.ugent.be>
 <87y4zutk4i.fsf@kamboji.qca.qualcomm.com>
 <53372210.7060903@intec.ugent.be> <53372A9A.1090402@candelatech.com>
 <5337C859.3040405@intec.ugent.be>
Date: Tue, 8 Apr 2014 15:45:12 +0300
In-Reply-To: <5337C859.3040405@intec.ugent.be> (Bart Jooris's message of "Sun, 
 30 Mar 2014 09:31:37 +0200")
Message-ID: <87wqf0kn1j.fsf@kamboji.qca.qualcomm.com>
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
To: Bart.Jooris@intec.ugent.be
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

Bart Jooris <bart.jooris@gmail.com> writes:

> Dear Ben,
>
> On 03/29/2014 09:18 PM, Ben Greear wrote:
>> On 03/29/2014 12:42 PM, Bart Jooris wrote:
>>
>>> -DSS-1300 with i5-2540M CPU @ 2.60GHz - 8GB RAM - SSD 64GB.
>>> -1 sparkLAN WPEA-351AC card with QCA9880 chip set and 3 dual band
>>> antenna's.
>>> -Kernel 3.13.5 containing the ath10k modules
>>> -firmwares cloned end of February
>>> -iperf in udp mode used for the  throughput test
>>
>> I get 500+Mbps on some other NICs with same chipset... 
>
> :-) Which cards are you using?
>
>> I'll get some
>> WPEA-351AC as soon as I can find someone willing to sell them and will
>> do some tests on those as well...
>
> I have 8 of those, I can lend you 2.

Can you setup a third board as a sniffer and see what's happening on the
air? But it's still more important to get ath10k and hostapd debug logs,
try to take those first.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
