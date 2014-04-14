Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZbyT-0003ui-Iz
 for ath10k@lists.infradead.org; Mon, 14 Apr 2014 08:10:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: load module ath10k: ieee80211 phy0: Failed to initialize wep: -2
References: <53461A8A.4030209@candelatech.com>
 <1397124355-6321-1-git-send-email-michal.kazior@tieto.com>
 <8738hkh193.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=gUBsw43M2at0y7iZU3VhwdjH9EBqzdOmKpxLjjqusPw@mail.gmail.com>
 <CA+BoTQ=L7Cj5V04RGEFcdGm1rxEO8NOYMEhSRiQNdoBoMTm5Pg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F06CC4837@srvexch01.SODIELEC.local>
 <CA+BoTQkAv_OrJ5cM-wp_fhdb01KV62gLqkXaSikYv9pS9t25eQ@mail.gmail.com>
Date: Mon, 14 Apr 2014 11:10:15 +0300
In-Reply-To: <CA+BoTQkAv_OrJ5cM-wp_fhdb01KV62gLqkXaSikYv9pS9t25eQ@mail.gmail.com>
 (Michal Kazior's message of "Mon, 14 Apr 2014 08:39:58 +0200")
Message-ID: <8738hgfi1k.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 11 April 2014 17:09, Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> wrote:
>> Hello everyone,
>> I try to load the module of driver ath10k on a cpu marvell 370 which ran linux 3.2.36, my module wifi is  WLE900VX.
>> These modules was built from backport 3.13.2-1.
>> After loading the module, I use the command "lsmod" and saw that 6 modules was loaded.
>> But my "dmesg" show an error:
>> ieee80211 phy0: Failed to initialize wep: -2
>> And the interface ath0 can not be recognized.

ath0 interface? ath10k does not use interface names like that, that
smells like the proprietary driver.

>> Does any one have any idea about this problem????
>
> I'm guessing here, but I suspect you tried to load a backports driver
> against cfg80211/mac80211 modules from your distro kernel.

Another option is that there's a some sort of problem with the crypto
modules.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
