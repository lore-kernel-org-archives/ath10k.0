Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm38-vm5.bullet.mail.bf1.yahoo.com ([72.30.239.21])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1Gn5-0007cx-Jo
 for ath10k@lists.infradead.org; Tue, 24 Nov 2015 16:50:04 +0000
Date: Tue, 24 Nov 2015 16:49:37 +0000 (UTC)
From: Joerg Pommnitz <pommnitz@yahoo.com>
Message-ID: <783909936.9966106.1448383777336.JavaMail.yahoo@mail.yahoo.com>
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

Thanks for the clarification.
Somebody should update 



https://wireless.wiki.kernel.org/en/users/Drivers/ath10k/firmware

It states, that 10.2 is for 3.18.
 -- Regards       Joerg



> Kalle Valo <kvalo@qca.qualcomm.com> schrieb am 16:50 Dienstag, 24.November 2015:
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
