Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aw2CE-0005Rk-Rb
 for ath10k@lists.infradead.org; Fri, 29 Apr 2016 06:46:39 +0000
From: "Hsu, Ryan" <ryanhsu@qca.qualcomm.com>
Subject: Re: Missing QCA6174 card in board-2.bin
Date: Fri, 29 Apr 2016 06:46:15 +0000
Message-ID: <1461912375453.83193@qca.qualcomm.com>
References: <CAE5PP10CJ=n8qghc4a1yi7TjdYU3b2C_-dxXFqyZWCLT8KmV0Q@mail.gmail.com>
 <CAE5PP11M+97YrMMW2uePi4caNZwiPN+QDdn9e1Nx9mNEBgNQ_w@mail.gmail.com>
 <20160426224003.GA6906@darkstar.example.net>
 <CA+BoTQnDraR4f8qA5eBsMh3nOAz6ZEHof=uBp+UsUM57hCkrZA@mail.gmail.com>
 <20160427110235.GA1799@darkstar.example.net>,
 <CA+BoTQmGkQYZtcx=BonBsyq4z=L77N=82-fZkgg6dGjMS+RRpw@mail.gmail.com>
In-Reply-To: <CA+BoTQmGkQYZtcx=BonBsyq4z=L77N=82-fZkgg6dGjMS+RRpw@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "gloudon.jamie@gmail.com" <gloudon.jamie@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

This seems to be like an typo, I'll fix and update.

Ryan
________________________________________
From: ath10k <ath10k-bounces@lists.infradead.org> on behalf of Michal Kazio=
r <michal.kazior@tieto.com>
Sent: Wednesday, April 27, 2016 4:04 AM
To: gloudon.jamie@gmail.com
Cc: ath10k@lists.infradead.org
Subject: Re: Missing QCA6174 card in board-2.bin

On 27 April 2016 at 13:02,  <gloudon.jamie@gmail.com> wrote:
> On Wed, Apr 27, 2016 at 07:17:44AM +0200, Michal Kazior wrote:
>> On 27 April 2016 at 00:40,  <gloudon.jamie@gmail.com> wrote:
>> > Hey,
>> >     The board-2.bin file is missing subsystem 168c:3344 for my qca6174
>> > hw ver 2.1. Does the kvalo's firmware repo requires an update?
>>
>> Hi,
>>
>> Is it 6174 or 6164?
>>
>> There is already a subsystem vendor entry matching this:
>>
>> ; strings board-2.bin  | grep bus | grep 3344
>> bus=3Dpci,vendor=3D168c,device=3D0041,subsystem-vendor=3D168c,subsystem-=
device=3D3344m
>> bus=3Dpci,vendor=3D168c,device=3D003e,subsystem-vendor=3D17aa,subsystem-=
device=3D3344m
>>
>> Can you specify what your device's vid/pid and susystem vid/pid are, ple=
ase?
>>
>>
>> Michal
>
> Here is both the device and subsystem's vid/pid below.
>
> Device [168c:003e] (rev 20), Subsystem: Device [168c:3344]

Thanks for confirming!


Micha=B3

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
