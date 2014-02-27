Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJ1PQ-0006SL-BB
 for ath10k@lists.infradead.org; Thu, 27 Feb 2014 13:53:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Anyone have a working hostapd conf file for AC?
References: <530D128B.3030509@candelatech.com>
 <87sir5kc5t.fsf@kamboji.qca.qualcomm.com>
 <530E2873.8000506@candelatech.com> <530E6DBF.4060407@candelatech.com>
 <CAEFj985joW0f6EnOriFoY6cLSQVSBEj7jc5JQMjG0wXPt54NKg@mail.gmail.com>
Date: Thu, 27 Feb 2014 15:53:28 +0200
In-Reply-To: <CAEFj985joW0f6EnOriFoY6cLSQVSBEj7jc5JQMjG0wXPt54NKg@mail.gmail.com>
 (Yeoh Chun-Yeow's message of "Thu, 27 Feb 2014 21:42:32 +0800")
Message-ID: <87k3cgfyqv.fsf@kamboji.qca.qualcomm.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:

>> With this I can get around 380Mbps TCP throughput downloading,
>> over the air, using the .467 firmware.  I have not yet tried to
>> do any significant tuning to improve this throughput.
>
> Quite impressive. Is this tested using iperf? I saw that even though
> the rx rate is MCS9 NSS 3 SGI 80MHz. I only get about 98Mbps TCP
> throughput using IPerf.

Huh, that's really bad. I haven't done any throughput tests for months,
but when I did I was able to easily get over 500 Mbps with iperf TCP OTA
tests (can't remember if TX or RX was better). This was on an x86
laptop.

When running throughput tests make sure to disable all possible kernel
debugging you have. Starting from CONFIG_ATH10K_DEBUG all the way to
slub debugging etc.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
