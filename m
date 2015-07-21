Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHTrb-00027j-Ek
 for ath10k@lists.infradead.org; Tue, 21 Jul 2015 09:29:28 +0000
Received: by wgmn9 with SMTP id n9so151100273wgm.0
 for <ath10k@lists.infradead.org>; Tue, 21 Jul 2015 02:29:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87pp3lq2xx.fsf@kamboji.qca.qualcomm.com>
References: <CAMQd7maa410JYZL7CvX+us99-ZjUNKMCPjK6cRBJFUY4NBj=0g@mail.gmail.com>
 <CAMQd7mb8o4__K+D-+HhJ07M773b96HiXwLqmwGBU0-oLNdhXGA@mail.gmail.com>
 <87pp3lq2xx.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 21 Jul 2015 11:29:04 +0200
Message-ID: <CAMQd7mboE4Uhypmr6g1_2vfhqDDmT8EkZg++WyBdwT77YtEcLQ@mail.gmail.com>
Subject: Re: qca6174 hw2.1 firmware crash with kernel 4.1.2
From: Enrico Tagliavini <enrico.tagliavini@gmail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

Hi Kalle,

thank you very much. Hope to also see the firmware out soon :).

Best regards

On 21 July 2015 at 11:23, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Enrico Tagliavini <enrico.tagliavini@gmail.com> writes:
>
>> Mhm seems like I assumed the backport missing from 4.0 was merged for
>> 4.1.... but it is not, it's in 4.2 only. Any chance you'll ask for a
>> backport of this 4 lines patch?
>>
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/ath/ath10k?id=11a002efbaa7fbd9f6e616695ab42aa9f1caf060
>>
>> Would be much appreciated
>
> Thanks for the suggestion, I'll send the patch to 4.1 stable releases.
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
