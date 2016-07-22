Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x236.google.com ([2607:f8b0:4002:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bQZTA-0005Xd-VY
 for ath10k@lists.infradead.org; Fri, 22 Jul 2016 12:22:22 +0000
Received: by mail-yw0-x236.google.com with SMTP id r9so101743070ywg.0
 for <ath10k@lists.infradead.org>; Fri, 22 Jul 2016 05:22:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1469188781289.75799@qti.qualcomm.com>
References: <CABPxzYLwye1t1Ycjr3nO5C18vc7OqS9dbbQ1yJ7B-YN+Bkx_PA@mail.gmail.com>
 <CABPxzYL5DHU7ZE1X1AibygBUz0TJEnNLLTp5_hDivmBBkjnVtg@mail.gmail.com>
 <1467972560885.99812@qti.qualcomm.com>
 <CABPxzY+8Y-FHUFALGueN1hQwgjJHNpeyy_BRkrM4osguxJZS0Q@mail.gmail.com>
 <1467982766213.21223@qti.qualcomm.com>
 <CABPxzYLO8rzvOJ_1iqng89kYFS-xqC3qstbgETVRJHDpO4rikQ@mail.gmail.com>
 <CABPxzYJPi4CqO+KUFA7=r=zpq_c2vFtrgBQ+nF_nThO-cYrteg@mail.gmail.com>
 <CABPxzYKomhw5rF4Crj6sMbmr3VuuDYi=zqN2ky83v-=RJe7Zhg@mail.gmail.com>
 <1469188781289.75799@qti.qualcomm.com>
From: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Date: Fri, 22 Jul 2016 17:51:40 +0530
Message-ID: <CABPxzYL2D1b08vOJc9b9WCjjEDtgHW2UQFNVSyxD5wSjidmiQA@mail.gmail.com>
Subject: Re: ath10k + iw set bitrates is causing FW crash
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On Fri, Jul 22, 2016 at 5:29 PM, Manoharan, Rajkumar
<rmanohar@qti.qualcomm.com> wrote:
> [...]
>> >> Thanks Raj, with this fix the rates are 0-7, if i disable then i am
>> >> seeing 0-9, so its
>> >> working.
>> >>
>> >> But i am seeing a weird issues, the moment i give bitrates command,
>> >> ath10k no longer does encryption, link is a WPA2-PSK: AES. Even after
>> >> interface up/down
>> >> it doesn't work.
>>> After reboot i dont see the "unencrypted" packet issue, i will do
>>> some more testing on limiting the rates, currently in my setup its
>>> not reaching MCS9 so cannot verify now.
>> Rajkumar,
>>
>> I am still not able to make mcs9 work, so i have tried to change the Nss to 1
>> using iw, but that is not taking affect. This command is not taking effect.
>>
> you mean not able to fix VHT rates alone. am i right? By auto rate mode, is firmware selecting
> mcs9? What is the command used for fixing vht rate?
Basically my requirement is to disable MCS8 and 9 for comparison.
to check whether ath10k honors the iw command, i used below
command. changing to 1SS, but i could see that it still transmits
using 2SS. Does your patch ignore these settings except for
adhoc mode?

iw set bitrates vht-mcs-5 1:0-7

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
