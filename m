Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp3.ugent.be ([157.193.49.127])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTYRY-0008Sr-N5
 for ath10k@lists.infradead.org; Fri, 28 Mar 2014 15:11:48 +0000
Received: from localhost (mcheck2.ugent.be [157.193.49.249])
 by smtp3.ugent.be (Postfix) with ESMTP id A0B64C3CA
 for <ath10k@lists.infradead.org>; Fri, 28 Mar 2014 16:11:10 +0100 (CET)
Received: from smtp3.ugent.be ([IPv6:::ffff:157.193.49.127])
 by localhost (mcheck2.UGent.be [::ffff:157.193.43.11]) (amavisd-new,
 port 10024)
 with ESMTP id HZBAbSdsCUWY for <ath10k@lists.infradead.org>;
 Fri, 28 Mar 2014 16:11:11 +0100 (CET)
Received: from mail2.intec.ugent.be (mail2.intec.ugent.be [157.193.214.245])
 by smtp3.ugent.be (Postfix) with ESMTP id D4BCFC146
 for <ath10k@lists.infradead.org>; Fri, 28 Mar 2014 16:11:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail2.intec.ugent.be (Postfix) with ESMTP id 4993024
 for <ath10k@lists.infradead.org>; Fri, 28 Mar 2014 16:16:21 +0100 (CET)
Received: from mail2.intec.ugent.be ([127.0.0.1])
 by localhost (mail2.intec.ugent.be [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hXpJjX+0R36f for <ath10k@lists.infradead.org>;
 Fri, 28 Mar 2014 16:16:21 +0100 (CET)
Received: from [157.193.214.167] (eckel.intec.ugent.be [157.193.214.167])
 by mail2.intec.ugent.be (Postfix) with ESMTP id 342BB23
 for <ath10k@lists.infradead.org>; Fri, 28 Mar 2014 16:16:21 +0100 (CET)
Message-ID: <5335910B.3000702@intec.ugent.be>
Date: Fri, 28 Mar 2014 16:11:07 +0100
From: Bart Jooris <Bart.Jooris@intec.ugent.be>
MIME-Version: 1.0
Subject: Re: Running throughput tests
References: <00ea01cee403$5331f1e0$f995d5a0$@sparklan.com>
 <006301cef71c$d850ec10$88f2c430$@sparklan.com>
 <52A98706.7080907@intec.ugent.be>
 <008d01cef722$2a9c05e0$7fd411a0$@sparklan.com>
 <52A9DEF9.8080305@intec.ugent.be>
 <012e01cef7e0$99017e70$cb047b50$@sparklan.com>
 <52AACFB9.8080901@intec.ugent.be>
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
In-Reply-To: <87y50weecb.fsf_-_@kamboji.qca.qualcomm.com>
Reply-To: Bart.Jooris@intec.ugent.be
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
To: ath10k@lists.infradead.org

Dear Kalle,

On 02/27/2014 04:59 PM, Kalle Valo wrote:
> Changing subject.
>
> Bart Jooris<Bart.Jooris@intec.ugent.be>  writes:
>
>> Just got a stable 160Mbps (iperf udp, tweeking the distance and ended
>> up around 50cm) on a Ubuntu 13.10 client (regulatory.bin still not
>> ok).
>> Not yet the 300Mbps as I read earlier on the thread.
>> What could be the next steps to speed up the link?
> First I would use the full hostapd configuration which I just added to
> the wiki:
>
> http://wireless.kernel.org/en/users/Drivers/ath10k/configuration#Full_hostapd_configuration
>
> Next I would disable all possible debug features from kernel and make
> sure that they are not included in the build. And last try to find a
> free channel with little interference as possible.
>
> I'm sure others have better ideas.
>
No luck for now. 160Mbps seems to be the limit using the mentioned 
configuration (I had to fix the channel to 36 and add 
vht_oper_centr_freq_seg0_idx=42 again to bring up the AP)
I'm using sparkLAN WPEA-351AC cards with QCA9880 chip set.
I' ve got this info from SparkLAN:

On 03/03/2014 11:35 AM, (SparkLAN) wrote:
> It seems like you are trying to test on AP mode with DFS band, but 
> unfortunately Ath9K and 10K does not support that so far. 

You are probably using Compex cards with the same chip set?
Based on the chip set, I should be able to get higher bitrates or is it 
possbile that the WPEA-351AC card needs another configuration?

Thanks a lot,

Bart


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
