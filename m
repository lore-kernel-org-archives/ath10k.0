Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSLq8-0000jd-WC
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 07:32:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: RE : Compilation ath10k
References: <EE97821C81277E459BEA5C6384C6F241012D6392146F@srvexch01.SODIELEC.local>
 <871txxh0t8.fsf@kamboji.qca.qualcomm.com>
 <EE97821C81277E459BEA5C6384C6F241012D63921470@srvexch01.SODIELEC.local>
Date: Tue, 25 Mar 2014 09:31:38 +0200
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012D63921470@srvexch01.SODIELEC.local>
 (Vu Hai NGUYEN's message of "Thu, 20 Mar 2014 11:30:03 +0100")
Message-ID: <87ppla3fad.fsf@kamboji.qca.qualcomm.com>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: ath10k <ath10k@lists.infradead.org>

Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> writes:

> Thak you Valo for your response,  i'm doing an internship and my mission is replacing 
> the module wifi WLE350NX (used chipset of Atheros and satisfied the standard 802.11n) by the new one
> WLE900VX to satisfy the standard 802.11ac for a router. Our actual driver is bought from Atheros (Driver Aquila)
> and i have to replace that driver by ath10k. I tried to compile it from the menuconfig of our code but it has many errors (you can see from the attached file).
> Then I try to compile in backport as you said, I was on the step 8 (http://wireless.kernel.org/en/users/Drivers/ath10k/backports) and get this error but I don't really understand it:
> /--------------
> | You shouldn't run make in the backports tree, but only in
> | the generated output. This here is only the skeleton code
> | copied into the output directory. To use the backport system
> | from scratch, go into the top-level directory and run
> |	./gentree.py /path/to/linux-next/ /tmp/output
> | and then make menuconfig/... in the output directory. See
> |	./gentree.py --help
> | for more options.
> \--
> make[1]: *** [modules] Error 1
> make: *** [default] Error 

Normal users should not run gentree.py, instead it's recommended to take
official backports releases. I noticed that the wiki page was a bit
confusing and I tried to improve it a bit:

Here are simple instructions how to install ath10k from a backports release:

----------------------------------------------------------------------
Download latest backports release and unpack it.
Run defconfig for ath10k:
make defconfig-ath10k
Compile backports:
make
Install backports:
sudo make install
Reboot system and ath10k should load automatically.
See backports documentation for more info.
----------------------------------------------------------------------

http://wireless.kernel.org/en/users/Drivers/ath10k/backports#ath10k_backports_releases

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
