Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkZjY-0005vj-EE
 for ath10k@lists.infradead.org; Tue, 21 Apr 2015 15:05:09 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: implement more versatile set_bitrate_mask
References: <1428672772-9275-1-git-send-email-michal.kazior@tieto.com>
 <87618v44jv.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQnNNKF7riAgcVj1LupABAGodm751jxOUuZgam8u=wthUA@mail.gmail.com>
Date: Tue, 21 Apr 2015 18:04:15 +0300
In-Reply-To: <CA+BoTQnNNKF7riAgcVj1LupABAGodm751jxOUuZgam8u=wthUA@mail.gmail.com>
 (Michal Kazior's message of "Fri, 17 Apr 2015 09:30:51 +0200")
Message-ID: <87vbgpzfo0.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

>> To reduce support questions from the users it would be nice to give few
>> good examples how to use this with iw. And also it makes it easier to
>> test the patch. If you could send something I can add it to the commit
>> log.
>
> Should work:
>
>   iw wlan0 set bitrates legacy 1 6 12 ht-mcs 1 2 3
>   iw wlan0 set bitrates legacy-5 mcs-5 7 8 9
>   iw wlan0 set bitrates legacy-5 24 ht-mcs-5 vht-mcs-5 1:0-9
>
> Won't work:
>
>   iw wlan0 set bitrates legacy-5 ht-mcs-5 vht-mcs-5 1:0-5
>   iw wlan0 set bitrates vht-mcs-5 2:7-9
>
> (note the invalid VHT MCS ranges)

Thanks, I added these to the commit log.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
