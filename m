Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm39-vm0.bullet.mail.ne1.yahoo.com ([98.138.229.160])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1Gtl-0003AJ-Ff
 for ath10k@lists.infradead.org; Tue, 24 Nov 2015 16:56:58 +0000
Date: Tue, 24 Nov 2015 16:53:38 +0000 (UTC)
From: Joerg Pommnitz <pommnitz@yahoo.com>
Message-ID: <55084199.10559917.1448384018556.JavaMail.yahoo@mail.yahoo.com>
In-Reply-To: <87mvu3qtur.fsf@kamboji.qca.qualcomm.com>
References: <87mvu3qtur.fsf@kamboji.qca.qualcomm.com>
Subject: Re: kvalo firmware confusion
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: Joerg Pommnitz <pommnitz@yahoo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

And a little bit of nagging: the current driver is still broken for me.
See http://lists.infradead.org/pipermail/ath10k/2015-November/006494.html

 -- Regards       Joerg



> Kalle Valo <kvalo@qca.qualcomm.com> schrieb am 16:51 Dienstag, 24.November 2015:
> > Joerg Pommnitz <pommnitz@yahoo.com> writes:
> 
> 
>>  Hello all,
>>  I'm confused about the git firmware situation for QCA988X.
>> 
>>  I'm on linux 3.18.24. The driver want's to load firmware-2.bin. 
> 
> With that old version of ath10k you should use 10.1 branch:
> 
> https://github.com/kvalo/ath10k-firmware/tree/master/QCA988X/10.1
> 
> But I really recommend using newer ath10k, for example by using
> backports projects.
> 
> -- 
> Kalle Valo
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
