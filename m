Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XGAUl-0007hz-M1
 for ath10k@lists.infradead.org; Sat, 09 Aug 2014 17:31:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v5 6/7] ath10k: save firmware RAM and ROM BSS sections on
 crash
References: <20140808201815.20713.85582.stgit@potku.adurom.net>
 <20140808202920.20713.58726.stgit@potku.adurom.net>
 <53E550F2.1040209@candelatech.com>
 <87d2caw632.fsf@kamboji.qca.qualcomm.com>
 <53E6523F.1060001@candelatech.com>
Date: Sat, 9 Aug 2014 20:31:22 +0300
In-Reply-To: <53E6523F.1060001@candelatech.com> (Ben Greear's message of "Sat, 
 9 Aug 2014 09:54:23 -0700")
Message-ID: <87oavttvrp.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

>> Third option is that we allocate crash dump buffers after the firmware
>> has been loaded and FW IEs are read. That way we don't allocate any
>> extra memory but the fundamental problem still persists.
>
> I'd prefer this third option..seems more elegant all around.
>
> I don't think you can do vmalloc in atomic context, btw.  But, can do it
> on firmware load.

Ok, I'll look how to implement this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
