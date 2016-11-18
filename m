Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1a.mailbox.org ([80.241.60.218])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7qJ9-0001kS-11
 for ath10k@lists.infradead.org; Fri, 18 Nov 2016 21:02:51 +0000
From: "Conrad Kostecki" <ck+ath10k@bl4ckb0x.de>
Subject: Re[6]: Linux freezes after a time while running
Date: Fri, 18 Nov 2016 20:55:52 +0000
Message-Id: <emd4599041-0b55-4d81-bfb1-4dde79408e41@valkyrie>
In-Reply-To: <CA+BoTQ=TMHfHJOAuystH_K-Uu7nP-t9BZhL6MpjHstU1QBe52g@mail.gmail.com>
References: <1403930336.4012.1477681558487@office.mailbox.org>
 <CA+BoTQmbz1vHjn0Xbo2hKcb9v8MdN5uTEnVNOAK0Kfh_NwTp5w@mail.gmail.com>
 <ema51f2924-a0bb-4f7a-8d84-3ee6fb82e317@valkyrie>
 <CA+BoTQkyd2f78Pk=_FrYyuQXedn8t6EEYq6BWHB8zthOF_AZ6w@mail.gmail.com>
 <1233772075.6396.1478077219620@office.mailbox.org>
 <CA+BoTQnOGOAEvM=M-1TqaN3GPgSJ2CUX-6Upa38jmaRzW9JkGA@mail.gmail.com>
 <1204267275.1178.1478525905172@office.mailbox.org>
 <CA+BoTQniCnXce6-w9SPp_aiuei8bjfbVJSkvXi_p4ew_Ed4Qdg@mail.gmail.com>
 <em6522b3b0-023a-4914-bdd1-d5f8734f6c75@valkyrie>
 <CA+BoTQ=TMHfHJOAuystH_K-Uu7nP-t9BZhL6MpjHstU1QBe52g@mail.gmail.com>
Mime-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: Conrad Kostecki <ck+ath10k@bl4ckb0x.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Michal,

Am 18.11.2016 15:47:42, "Michal Kazior" <michal.kazior@tieto.com> 
schrieb:

>Hmm.. looks like there's a stall in target-host communication for ~5
>seconds (89 suppressed warnings match 2 vifs beaconing at ~100ms
>interval).
>
>Did you try running without multi-BSS, i.e. just one AP vif? That's
>probably not going to help but it's worth ruling that out.
>
>

I've now run a test and as you said, it did not helped.

Cheers
Conrad


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
