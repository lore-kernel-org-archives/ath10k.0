Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WI0Nu-0007e6-RX
 for ath10k@lists.infradead.org; Mon, 24 Feb 2014 18:36:11 +0000
Message-ID: <530B90E0.8080101@candelatech.com>
Date: Mon, 24 Feb 2014 10:35:12 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone have luck with WLE900VX?
References: <5307F7D3.1030703@candelatech.com>
 <87fvn8trh2.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87fvn8trh2.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

On 02/24/2014 08:17 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:

>> Both NICs that I have tried so far report the same mostly bogus
>> MAC:  00:03:07:12:34:56
>>
>> The NIC's spec sheet claims it is 3x3, but 'iw phy phyX info' shows only
>> 2 streams supported for both the 2.4Ghz n band and the 5Ghz /ac band.
> 
> Hmm, I wonder if otp.bin fails. Can you check what result code you get
> from otp.bin? Add something like this to ath10k_download_and_run_otp():
> 
> 	ret = ath10k_bmi_execute(ar, address, &exec_param);
>         ath10k_dbg(ATH10K_DBG_BOOT, "boot otp execute result %d\n", exec_param);

I tried the standard .389 firmware that mine is based on, and I see similar non-working
behaviour, so it does not appear to be a bug I added to my firmware.

I also notice that the otp binary in the .467.1-1 firmware is a fair bit bigger
than what is included in the .389 firmware.

So, probably I need fixes to otp (at least).

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
