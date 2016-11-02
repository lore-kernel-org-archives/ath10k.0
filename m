Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx2.mailbox.org ([80.241.60.215])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1zHJ-0004gy-BC
 for ath10k@lists.infradead.org; Wed, 02 Nov 2016 17:24:47 +0000
From: "Conrad Kostecki" <ck@conrad-kostecki.de>
Subject: Re[4]: Linux freezes after a time while running
Date: Wed, 02 Nov 2016 17:24:12 +0000
Message-Id: <eme593b679-b2a4-490c-b9ab-5f189390fc86@valkyrie>
In-Reply-To: <103474143.9371.1478103316012@office.mailbox.org>
References: <1403930336.4012.1477681558487@office.mailbox.org>
 <CA+BoTQmbz1vHjn0Xbo2hKcb9v8MdN5uTEnVNOAK0Kfh_NwTp5w@mail.gmail.com>
 <ema51f2924-a0bb-4f7a-8d84-3ee6fb82e317@valkyrie>
 <CA+BoTQkyd2f78Pk=_FrYyuQXedn8t6EEYq6BWHB8zthOF_AZ6w@mail.gmail.com>
 <1233772075.6396.1478077219620@office.mailbox.org>
 <CA+BoTQnOGOAEvM=M-1TqaN3GPgSJ2CUX-6Upa38jmaRzW9JkGA@mail.gmail.com>
 <103474143.9371.1478103316012@office.mailbox.org>
Mime-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: Conrad Kostecki <ck@conrad-kostecki.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k@lists.infradead.org


Am 02.11.2016 17:15:15, "Conrad Kostecki" <ck+ath10k@bl4ckb0x.de> 
schrieb:

>That does not seem to work?
>
>iw dev wlp7s0 set txpower fixed 15
>command failed: Operation not supported (-95)
>
>iw dev wlp7s0 set txpower limit 15
>command failed: Operation not supported (-95)
>
>

Sorry, my fault. Setting to e.g. 20mW worked.
But did not help, as the problem still happens with lower txpower.

Cheers
Conrad


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
