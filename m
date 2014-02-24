Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHyEO-00021e-U7
 for ath10k@lists.infradead.org; Mon, 24 Feb 2014 16:18:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Anyone have luck with WLE900VX?
References: <5307F7D3.1030703@candelatech.com>
Date: Mon, 24 Feb 2014 18:17:45 +0200
In-Reply-To: <5307F7D3.1030703@candelatech.com> (Ben Greear's message of "Fri, 
 21 Feb 2014 17:05:23 -0800")
Message-ID: <87fvn8trh2.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> I managed to get a few WLE900VX, and I've seen some funny things so far.

Do you have any more info what type of board it is? Is it CUS223, XBNNN
(N being a decimal) or something else?

What's the chip id?

> First, with the official firmware 10.1.467.1-1 it immediately crashes on startup.
> I don't have that firmware source, so I don't know why it crashes.
> I wasn't even trying to create more than the default wlanX station.

Is that with stock ath10k driver or does ath10k contain any custom
changes?

> With my firmware (based on 10.1.389), it boots up OK and I can create
> and associate 32 station vifs.
>
> Both NICs that I have tried so far report the same mostly bogus
> MAC:  00:03:07:12:34:56
>
> The NIC's spec sheet claims it is 3x3, but 'iw phy phyX info' shows only
> 2 streams supported for both the 2.4Ghz n band and the 5Ghz /ac band.

Hmm, I wonder if otp.bin fails. Can you check what result code you get
from otp.bin? Add something like this to ath10k_download_and_run_otp():

	ret = ath10k_bmi_execute(ar, address, &exec_param);
        ath10k_dbg(ATH10K_DBG_BOOT, "boot otp execute result %d\n", exec_param);

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
