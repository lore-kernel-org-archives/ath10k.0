Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wa18n-0002la-GU
 for ath10k@lists.infradead.org; Tue, 15 Apr 2014 11:03:02 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Report Firmware  firmware-2.bin_10.1.467.2-1 Error
References: <53461A8A.4030209@candelatech.com>
 <1397124355-6321-1-git-send-email-michal.kazior@tieto.com>
 <8738hkh193.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=gUBsw43M2at0y7iZU3VhwdjH9EBqzdOmKpxLjjqusPw@mail.gmail.com>
 <CA+BoTQ=L7Cj5V04RGEFcdGm1rxEO8NOYMEhSRiQNdoBoMTm5Pg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F06CC4837@srvexch01.SODIELEC.local>
 <CA+BoTQkAv_OrJ5cM-wp_fhdb01KV62gLqkXaSikYv9pS9t25eQ@mail.gmail.com>
 <8738hgfi1k.fsf@kamboji.qca.qualcomm.com>
 <EE97821C81277E459BEA5C6384C6F241012F06CC4838@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F06CC4839@srvexch01.SODIELEC.local>
Date: Tue, 15 Apr 2014 14:02:30 +0300
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F06CC4839@srvexch01.SODIELEC.local>
 (Vu Hai NGUYEN's message of "Tue, 15 Apr 2014 10:20:45 +0200")
Message-ID: <87eh0yetyx.fsf@kamboji.qca.qualcomm.com>
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
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> writes:

> When I load the firmware-2.bin_10.1.467.2-1 I got this error when I
> put my device in mode ACCESS POINT: "PCI express error: irq - 228, Pex
> number: 0, Interrupt Cause Register value: 10" But if I use the
> version 999.999.0.x. I don't have this error.

I wonder if this has something to do with cold reset causing PCI bus
errors? But we need more information to say more. Can you send the full
dmesg output (from the beginning of kernel boot) along with detailed
descriptions of your host platform and what kind qca98xx board you have.

Even better is if you can also send a debug log output using debug mask
value 0x432. More info:

http://wireless.kernel.org/en/users/Drivers/ath10k/debug#Useful_debug_masks

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
