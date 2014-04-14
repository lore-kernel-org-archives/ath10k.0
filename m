Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZjB6-0005mx-EP
 for ath10k@lists.infradead.org; Mon, 14 Apr 2014 15:52:13 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Mon, 14 Apr 2014 17:49:21 +0200
Subject: RE : load module ath10k: ieee80211 phy0: Failed to initialize wep: -2
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F06CC4838@srvexch01.SODIELEC.local>
References: <53461A8A.4030209@candelatech.com>
 <1397124355-6321-1-git-send-email-michal.kazior@tieto.com>
 <8738hkh193.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=gUBsw43M2at0y7iZU3VhwdjH9EBqzdOmKpxLjjqusPw@mail.gmail.com>
 <CA+BoTQ=L7Cj5V04RGEFcdGm1rxEO8NOYMEhSRiQNdoBoMTm5Pg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F06CC4837@srvexch01.SODIELEC.local>
 <CA+BoTQkAv_OrJ5cM-wp_fhdb01KV62gLqkXaSikYv9pS9t25eQ@mail.gmail.com>,
 <8738hgfi1k.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <8738hgfi1k.fsf@kamboji.qca.qualcomm.com>
Content-Language: fr-FR
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>, Michal Kazior <michal.kazior@tieto.com>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Thank you guys,
My mistake, the interface is wlan0, not ath0 (which is created before from =
the driver Aquila supplied by Atheros)
And the problem about cfg80211/mac80211 is because that I didn't activate c=
fg80211 in my new kernel of linux when I re-compile my project. (I just tak=
e the modules ath10k that I compiled before from the kernel that I had modi=
fied to compile ath10k and then put in my new project)

NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE

________________________________________
De : Kalle Valo [kvalo@qca.qualcomm.com]
Date d'envoi : lundi 14 avril 2014 10:10
=C0 : Michal Kazior
Cc : Vu Hai NGUYEN; Patrick CARNEIRO RODRIGUEZ; ath10k@lists.infradead.org
Objet : Re: load module ath10k: ieee80211 phy0: Failed to initialize wep: -2

Michal Kazior <michal.kazior@tieto.com> writes:

> On 11 April 2014 17:09, Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> wrote:
>> Hello everyone,
>> I try to load the module of driver ath10k on a cpu marvell 370 which ran=
 linux 3.2.36, my module wifi is  WLE900VX.
>> These modules was built from backport 3.13.2-1.
>> After loading the module, I use the command "lsmod" and saw that 6 modul=
es was loaded.
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
