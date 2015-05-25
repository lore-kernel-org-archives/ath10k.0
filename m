Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ywzto-0007DE-NR
 for ath10k@lists.infradead.org; Mon, 25 May 2015 21:27:05 +0000
References: <1431434736-7077-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQ=dzJS447Gx+XAXPT6gZDDKZ__6scbxe0QC-iMA47bZmQ@mail.gmail.com>
 <874mn68jl7.fsf@kamboji.qca.qualcomm.com>
 <87oal83kv4.fsf@kamboji.qca.qualcomm.com> <5563577E.4020208@dd-wrt.com>
 <5563584A.80604@candelatech.com> <55636088.1080506@dd-wrt.com>
 <55636198.8020802@candelatech.com> <55637637.8020103@dd-wrt.com>
 <556378E3.7050707@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <55639395.6070207@dd-wrt.com>
Date: Mon, 25 May 2015 23:26:45 +0200
MIME-Version: 1.0
In-Reply-To: <556378E3.7050707@candelatech.com>
Subject: possible memory leak or memory waste
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
To: ath10k@lists.infradead.org

today using the latest testing driver, i found out the memory 
consumption is unbelievable high.
my router here has 64 mb ram. this ram is fully taken after some minutes 
by ath10k. but only if data flow present.

here the results of "free" after some minutes
root@DD-WRT:~# free
total         used         free       shared      buffers
Mem:         61636        58752         2884            0 2600
-/+ buffers:              56152         5484
Swap:            0            0            0


now i terminate hostapd which controls the ath10k chipset


root@DD-WRT:~# kill 902
root@DD-WRT:~# free
total         used         free       shared      buffers
Mem:         61636        23212        38424            0 2416
-/+ buffers:              20796        40840
Swap:            0            0            0


you see the difference?


regards,
Sebastian Gottschall

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
