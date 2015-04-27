Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ymjqp-000270-QL
 for ath10k@lists.infradead.org; Mon, 27 Apr 2015 14:17:36 +0000
Message-ID: <553E44E9.7020007@candelatech.com>
Date: Mon, 27 Apr 2015 07:17:13 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Tips to debug Firmware crash
References: <CABHL29Hq8e+sgyfqtN-EbEpM1cC9XF_bO3F_rj68Piq-kKg4=w@mail.gmail.com>
In-Reply-To: <CABHL29Hq8e+sgyfqtN-EbEpM1cC9XF_bO3F_rj68Piq-kKg4=w@mail.gmail.com>
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
To: Venkat Ch <venkatch@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 04/26/2015 10:48 PM, Venkat Ch wrote:
> Hi All,
>
>    I am an active developer of Atheros drivers for the last 10 years. I
> have been working on QCA 10.2.2 driver for the last few months and
> trying to understand the architecture of this offloading model. Though
> this forum is nothing to do with Atheros provided drivers, I took the
> liberty of posting the question to see if Ath10k community could help
> me. Sorry if I violated any guidelines.
>
> There is some problem at firmware level about which I am clueless.
> Whenever there is a crash in firmware the 5GHz interface goes down
> completely and there will not be any transmissions or receptions from
> the interface from then. What all I see on the console is  some log
> message "Target Asserted" . I don't get any stack trace to see in
> which function it crashed.
>
>   Can any of you please let me know if there is a way to dump the stack
> trace and debug the firmware crash?

I have tools to debug my modified 10.1 'CT' firmware and get backtraces and decode
the log messages and such.  I can't publish the details due to NDA, but I can
give vague descriptions of the problem and usually figure out a way to fix it.

For 10.2, you would need to talk to someone with that firmware source code,
as I have not been given access to it.

Thanks,
Ben


>
>
> Thanks & Regards
> Venkat
>
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
